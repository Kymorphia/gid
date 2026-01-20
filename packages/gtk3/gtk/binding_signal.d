/// Module for [BindingSignal] class
module gtk.binding_signal;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A GtkBindingSignal stores the necessary information to
    activate a widget in response to a key press via a signal
    emission.
*/
class BindingSignal
{
  GtkBindingSignal _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.binding_signal.BindingSignal");

    _cInstance = *cast(GtkBindingSignal*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `next` field.
      Returns: implementation detail
  */
  @property gtk.binding_signal.BindingSignal next()
  {
    return new gtk.binding_signal.BindingSignal(cast(GtkBindingSignal*)(cast(GtkBindingSignal*)this._cPtr).next, No.Take);
  }

  /**
      Get `signalName` field.
      Returns: the action signal to be emitted
  */
  @property string signalName()
  {
    return cToD!(string)(cast(void*)(cast(GtkBindingSignal*)this._cPtr).signalName);
  }

  /**
      Set `signalName` field.
      Params:
        propval = the action signal to be emitted
  */
  @property void signalName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkBindingSignal*)this._cPtr).signalName);
    dToC(propval, cast(void*)&(cast(GtkBindingSignal*)this._cPtr).signalName);
  }

  /**
      Get `nArgs` field.
      Returns: number of arguments specified for the signal
  */
  @property uint nArgs()
  {
    return (cast(GtkBindingSignal*)this._cPtr).nArgs;
  }

  /**
      Set `nArgs` field.
      Params:
        propval = number of arguments specified for the signal
  */
  @property void nArgs(uint propval)
  {
    (cast(GtkBindingSignal*)this._cPtr).nArgs = propval;
  }
}
