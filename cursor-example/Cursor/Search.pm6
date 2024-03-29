use v6.c;

use Evolution::Raw::Types;
use GTK::Raw::Types;

use GTK::Builder;
use Evolution::Book::Query;

use GTK::Builder::Roles::Widget;

my $ui-def;

constant SEARCH-UI-FILE = 'cursor-search.ui';

our enum SearchType is export <
	SEARCH_NAME
	SEARCH_PHONE
	SEARCH_EMAIL
>;

class Cursor::Search does GTK::Builder::Roles::Widget {
	has GTK::SearchEntry $!top         is parent-widget handles<
																       name
																       primary-icon-activatable
																       primary-icon-sensitive
																       show
																     >;
  has                  $!popup;
  has                  $!name_radio  is widget;
  has                  $!phone_radio is widget;
  has                  $!email_radio is widget;

  has SearchType $!type;
  has Str        $!sexp;

	has $!sexp-supplier;

  submethod BUILD {
		# Replaces the need for a GObject signal!
		$!sexp-supplier = Supplier.new;

		my $ip = $*PROGRAM.add(SEARCH-UI-FILE);
		$ui-def = $ip.slurp if $ip.e;

		my $builder = GTK::Builder.new-from-string(
			GTK::Builder.templateToUI($ui-def)
		);

		$!top = $builder.top-level;
    for $builder.pairs {
      when .key eq 'popup'          { $!popup       = .value }
      when .key eq 'name_radio'     { $!name_radio  = .value }
      when .key eq 'phone_radio'    { $!phone_radio = .value }
      when .key eq 'email_radio'    { $!email_radio = .value }
    }

		sub checkMenu ($w) {
			# cw: Needs to be a prettier/nicer way to check for poiner equiv.
			$!type = do given +$!popup.get-menu-item(:raw).p {
				when + $!name_radio.p { SEARCH_NAME  }
				when +$!phone_radio.p { SEARCH_PHONE }
				when +$!email_radio.p { SEARCH_EMAIL }
			}

			$!top.emit-changed;
		}

		for $!name_radio, $!phone_radio, $!email_radio {
			my $lex = $_;

			# Never use $_ in a closure.
			.toggled.tap({ checkMenu($lex) })
		}

		my \EBQ := Evolution::Book::Query;
		$!top.changed.tap({
			my $q;

			if $!top.text -> $text {
				$q = do given $!type {
					when SEARCH_NAME {
						EBQ.or(
							EBQ.field-test(E_CONTACT_FAMILY_NAME, E_BOOK_QUERY_CONTAINS, $text),
							EBQ.field-test(E_CONTACT_GIVEN_NAME, E_BOOK_QUERY_CONTAINS, $text)
						);
					}

					when SEARCH_PHONE {
						EBQ.field-test(E_CONTACT_TEL, E_BOOK_QUERY_CONTAINS, $text);
					}

					when SEARCH_EMAIL {
					  EBQ.field-test(E_CONTACT_EMAIL, E_BOOK_QUERY_CONTAINS, $text)
					}
				}
			}

			$!sexp = $q ?? ~$q !! '';
			$!sexp.supplier.emit($!sexp)
		});

		$!top.icon-press.tap(-> *@a {
			my $icon-pos     = GtkEntryIconPosition( @a[1] );

			$!popup.popup-at-pointer( @a[2] ) if $icon-pos == GTK_ENTRY_ICON_PRIMARY;
		});
  }

	method sexp         { $!sexp }

	method sexp-changed { $!sexp-supplier.Supply }

  # -XXX-
  # cw: Although role puns this, we're still suffering from the Method::Also
  #     no-aliases-from-role bug.
  method GTK::Raw::Definitions::GtkWidget { $!top.GtkWidget }
  method GtkWidget                        { $!top.GtkWidget }
  
}

BEGIN {
	$ui-def = q:to/UI-DEF/;
		<?xml version="1.0" encoding="UTF-8"?>
		<interface>
		  <!-- interface-requires gtk+ 3.10 -->
		  <template class="CursorSearch" parent="GtkSearchEntry">
		    <property name="visible">True</property>
		    <property name="can_focus">True</property>
		    <property name="primary_icon_name">edit-find-symbolic</property>
		    <signal name="changed" handler="cursor_search_entry_changed" swapped="yes"/>
		    <signal name="icon-press" handler="cursor_search_icon_press" swapped="yes"/>
		  </template>
		  <object class="GtkMenu" id="popup">
		    <property name="visible">True</property>
		    <property name="can_focus">False</property>
		    <child>
		      <object class="GtkRadioMenuItem" id="name_radio">
		        <property name="visible">True</property>
		        <property name="can_focus">False</property>
		        <property name="label" translatable="yes">Name</property>
		        <property name="use_underline">True</property>
		        <property name="active">True</property>
		        <property name="draw_as_radio">True</property>
		        <signal name="toggled" handler="cursor_search_option_toggled" swapped="yes"/>
		      </object>
		    </child>
		    <child>
		      <object class="GtkRadioMenuItem" id="phone_radio">
		        <property name="visible">True</property>
		        <property name="can_focus">False</property>
		        <property name="label" translatable="yes">Phonenumber</property>
		        <property name="use_underline">True</property>
		        <property name="draw_as_radio">True</property>
		        <property name="group">name_radio</property>
		        <signal name="toggled" handler="cursor_search_option_toggled" swapped="yes"/>
		      </object>
		    </child>
		    <child>
		      <object class="GtkRadioMenuItem" id="email_radio">
		        <property name="visible">True</property>
		        <property name="can_focus">False</property>
		        <property name="label" translatable="yes">Email</property>
		        <property name="use_underline">True</property>
		        <property name="draw_as_radio">True</property>
		        <property name="group">name_radio</property>
		        <signal name="toggled" handler="cursor_search_option_toggled" swapped="yes"/>
		      </object>
		    </child>
		  </object>
		</interface>
		UI-DEF

	}
