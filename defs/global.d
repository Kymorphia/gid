//!info name gid
//!info description "GObject introspection D binding package repository"
//!info copyright "Copyright © 2024-2025, Kymorphia, PBC"
//!info authors "Element Green <element@kymorphia.com>"
//!info homepage https://gid.dub.pm
//!info license MIT

//# Dlang reserved words
//!reserved abstract
//!reserved alias
//!reserved align
//!reserved asm
//!reserved assert
//!reserved auto
//!reserved body
//!reserved bool
//!reserved break
//!reserved byte
//!reserved case
//!reserved cast
//!reserved catch
//!reserved cdouble
//!reserved cent
//!reserved cfloat
//!reserved char
//!reserved class
//!reserved const
//!reserved continue
//!reserved creal
//!reserved dchar
//!reserved debug
//!reserved default
//!reserved delegate
//!reserved delete
//!reserved deprecated
//!reserved do
//!reserved double
//!reserved dstring
//!reserved else
//!reserved enum
//!reserved export
//!reserved extern
//!reserved false
//!reserved final
//!reserved finally
//!reserved float
//!reserved for
//!reserved foreach
//!reserved foreach_reverse
//!reserved function
//!reserved goto
//!reserved idouble
//!reserved if
//!reserved ifloat
//!reserved immutable
//!reserved import
//!reserved in
//!reserved init
//!reserved inout
//!reserved int
//!reserved interface
//!reserved invariant
//!reserved ireal
//!reserved is
//!reserved lazy
//!reserved long
//!reserved macro
//!reserved mixin
//!reserved module
//!reserved new
//!reserved nothrow
//!reserved null
//!reserved out
//!reserved override
//!reserved package
//!reserved pragma
//!reserved private
//!reserved protected
//!reserved public
//!reserved pure
//!reserved real
//!reserved ref
//!reserved return
//!reserved scope
//!reserved shared
//!reserved short
//!reserved static
//!reserved string
//!reserved struct
//!reserved super
//!reserved switch
//!reserved synchronized
//!reserved template
//!reserved this
//!reserved throw
//!reserved true
//!reserved try
//!reserved typedef
//!reserved typeid
//!reserved typeof
//!reserved ubyte
//!reserved ucent
//!reserved uint
//!reserved ulong
//!reserved union
//!reserved unittest
//!reserved ushort
//!reserved version
//!reserved void
//!reserved volatile
//!reserved wchar
//!reserved while
//!reserved with

//# This conflicts with Object.toString method
//!reserved toString

//# Global type substitutions
//!subtype FILE void
//!subtype filename string
//!subtype gatomicrefcount int
//!subtype gboolean bool
//!subtype gchar char
//!subtype gconstpointer const(void)*
//!subtype gdouble double
//!subtype gfloat float
//!subtype gint int
//!subtype gint16 short
//!subtype gint32 int
//!subtype gint64 long
//!subtype gint8 byte
//!subtype gintptr ptrdiff_t
//!subtype goffset long
//!subtype gpointer void*
//!subtype grefcount int
//!subtype gshort short
//!subtype gsize size_t
//!subtype gssize ptrdiff_t
//!subtype ssize_t ptrdiff_t
//!subtype guchar ubyte
//!subtype guint uint
//!subtype guint16 ushort
//!subtype guint32 uint
//!subtype guint64 ulong
//!subtype guint8 ubyte
//!subtype guintptr size_t
//!subtype gunichar dchar
//!subtype gunichar2 ushort
//!subtype gushort ushort
//!subtype int8_t byte
//!subtype int16_t short
//!subtype int32 int
//!subtype int32_t int
//!subtype "long double" real
//!subtype none void
//!subtype passwd void
//!subtype pid_t int
//!subtype time_t long
//!subtype tm void
//!subtype uid_t uint
//!subtype uint8_t ubyte
//!subtype uint16_t ushort
//!subtype uint32_t uint
//!subtype "unsigned char" ubyte
//!subtype unsigned uint
//!subtype "unsigned int" uint
//!subtype utf8 string
//!subtype va_list void*

//# These are defined to different sizes depending on the platform
//!subtype "unsigned long" gulong

//# GType is used for D type when it should be Type
//!subdtype GType GObject.GType

//# Global XML patches

//# Generally free(), ref(), and unref() functions/methods aren't desirable
//!set *.*method[free][ignore] 1
//!set *.*method[ref][ignore] 1
//!set *.*method[unref][ignore] 1

//# Remove glib:get-type "intern"
//!del '*class[glib:get-type=intern][glib:get-type]'

//# Ignore all Class, Iface, Interface, Private records
//!set *record[*Class][ignore] 1
//!set *record[*Iface][ignore] 1
//!set *record[*Interface][ignore] 1
//!set *record[*Private][ignore] 1
//!set *class.field[priv][ignore] 1

//# Ignore fields with "reserved" or "dummy" in their names
//!set *.*field[*reserved*][ignore] 1
//!set *.*field[*dummy*][ignore] 1
