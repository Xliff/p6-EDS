use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Evolution::Raw::Distro;

use GLib::Roles::Pointers;

unit package Evolution::Raw::Definitions;

constant forced = 0;

constant camel_block_t is export := guint32;
constant camel_hash_t  is export := guint32;
constant camel_key_t   is export := guint32;

constant CamelCipherCloneFunc      is export := Pointer;    # gpointer (* CamelCipherCloneFunc) (gpointer value)
constant CamelIndexNorm            is export := Pointer;    # gchar * (*CamelIndexNorm)(CamelIndex *index, const gchar *word, gpointer user_data);
constant EFreeFormExpBuildSexpFunc is export := Pointer;
constant EListCopyFunc             is export := Pointer;
constant EListFreeFunc             is export := Pointer;

constant ecal           is export = version-by-distro('ecal');
constant ebook          is export = version-by-distro('ebook');
constant ebook-contacts is export = version-by-distro('ebook-contacts');
constant eds            is export = version-by-distro('edataserver');
constant ebackend       is export = version-by-distro('ebackend');

class CamelMsgPort               is repr<CPointer> is export does GLib::Roles::Pointers { }
class EBookQuery                 is repr<CPointer> is export does GLib::Roles::Pointers { }
class ECalComponentAlarm         is repr<CPointer> is export does GLib::Roles::Pointers { }
class ECalComponentAlarmInstance is repr<CPointer> is export does GLib::Roles::Pointers { }
class ECalComponentAlarmRepeat   is repr<CPointer> is export does GLib::Roles::Pointers { }
class ECalComponentAlarms        is repr<CPointer> is export does GLib::Roles::Pointers { }
class ECalComponentAlarmTrigger  is repr<CPointer> is export does GLib::Roles::Pointers { }
class ECalComponentAttendee      is repr<CPointer> is export does GLib::Roles::Pointers { }
class ECalComponentDateTime      is repr<CPointer> is export does GLib::Roles::Pointers { }
class ECalComponentId            is repr<CPointer> is export does GLib::Roles::Pointers { }
class ECalComponentOrganizer     is repr<CPointer> is export does GLib::Roles::Pointers { }
class ECalComponentParameterBag  is repr<CPointer> is export does GLib::Roles::Pointers { }
class ECalComponentPeriod        is repr<CPointer> is export does GLib::Roles::Pointers { }
class ECalComponentPrivate       is repr<CPointer> is export does GLib::Roles::Pointers { }
class ECalComponentPropertyBag   is repr<CPointer> is export does GLib::Roles::Pointers { }
class ECalComponentRange         is repr<CPointer> is export does GLib::Roles::Pointers { }
class ECalComponentText          is repr<CPointer> is export does GLib::Roles::Pointers { }
class EExtensible                is repr<CPointer> is export does GLib::Roles::Pointers { }
class ENamedParameters           is repr<CPointer> is export does GLib::Roles::Pointers { }
class EOAuth2Service             is repr<CPointer> is export does GLib::Roles::Pointers { }
class EVCardAttribute            is repr<CPointer> is export does GLib::Roles::Pointers { }
class EVCardAttributeParam       is repr<CPointer> is export does GLib::Roles::Pointers { }

constant CAMEL_FOLDER_TYPE_BIT               is export = 10;

constant E_OAUTH2_SECRET_REFRESH_TOKEN       is export = 'refresh_token';
constant E_OAUTH2_SECRET_ACCESS_TOKEN        is export = 'access_token';
constant E_OAUTH2_SECRET_EXPIRES_AFTER       is export = 'expires_after';

# Exceptions

class X::Evolution::VCard::AttributeVersionMismatch is Exception {
  has $.expected;
  has $.received;

  submethod BUILD (:$!expected, :$!received) { }

  method new ($expected, $received) {
    self.bless($expected, $received);
  }

  method message {
    "Encountered version {
     $!received } of an attribute when expecting version { $!expected }";
  }

}
