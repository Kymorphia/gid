module Gtk.ParamSpecExpression;

import GObject.ParamSpec;
import Gid.gid;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * A `GParamSpec` for properties holding a `GtkExpression`.
 */
class ParamSpecExpression : ParamSpec
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.ParamSpecExpression");

    super(cast(GParamSpec*)ptr, take);
  }
}
