//!kind basictypes Namespace
//!inhibit imports init funcs

public import std.bitmanip : bitfields;

import core.stdc.config : c_long, c_ulong;

// gulong/glong change size depending on if Windows or not
alias gulong = c_ulong;
alias glong = c_long;

alias gboolean = int;

/**
 * GIR name of a type of a giD binding, added by gidgen to the D declarations of the binding types (classes,
 * interfaces, structures, and the C enumerations, flags and structures of the c/types.d modules). Used to export
 * D-defined GObject types to GIR (see `_dGirType` in `gid.gobject2.dig`).
 */
struct gidGir
{
  string name; /// GIR type name without the namespace ("Widget")
  string typeStruct; /// GIR name of the class or interface structure ("WidgetClass"), or null
}
