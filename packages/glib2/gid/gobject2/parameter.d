/// Module for [Parameter] class
module gid.gobject2.parameter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.types;
import gid.gobject2.value;

/**
    The GParameter struct is an auxiliary structure used
    to hand parameter name/value pairs to [gid.gobject2.object.ObjectWrap.newv].

    Deprecated: This type is not introspectable.
*/
@gidGir("Parameter")
class Parameter : StructWrap!(GParameter)
{
  /**
      Create a `parameter.Parameter` wrap type.
      Params:
        name = the parameter name
  */
  this(string name = string.init) nothrow
  {
    this.name = name;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  private const(char)* _nameRef; // Keeps borrowed GC string alive

  /**
      Get `name` field.
      Returns: the parameter name
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GParameter*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = the parameter name
  */
  @property void name(string propval) nothrow
  {
    if (_refuseBorrowedStore("name"))
      return;

    _nameRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GParameter*)this._cPtr).name = cast(const(char)*)_nameRef;
  }

  /**
      Get `value` field.
      Returns: the parameter value
  */
  @property gid.gobject2.value.Value value() nothrow
  {
    return cToD!(gid.gobject2.value.Value)(cast(void*)&(cast(GParameter*)this._cPtr).value);
  }
}
