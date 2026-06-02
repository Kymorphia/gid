/// Module for [BindingSignal] class
module gtk.binding_signal;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GtkBindingSignal*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `next` field.
      Returns: implementation detail
  */
  @property gtk.binding_signal.BindingSignal next() nothrow
  {
    return new gtk.binding_signal.BindingSignal(cast(GtkBindingSignal*)(cast(GtkBindingSignal*)this._cPtr).next, No.Take);
  }

  /**
      Get `signalName` field.
      Returns: the action signal to be emitted
  */
  @property string signalName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkBindingSignal*)this._cPtr).signalName);
  }

  /**
      Set `signalName` field.
      Params:
        propval = the action signal to be emitted
  */
  @property void signalName(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GtkBindingSignal*)this._cPtr).signalName);
    dToC(propval, cast(void*)&(cast(GtkBindingSignal*)this._cPtr).signalName);
  }

  /**
      Get `nArgs` field.
      Returns: number of arguments specified for the signal
  */
  @property uint nArgs() nothrow
  {
    return (cast(GtkBindingSignal*)this._cPtr).nArgs;
  }

  /**
      Set `nArgs` field.
      Params:
        propval = number of arguments specified for the signal
  */
  @property void nArgs(uint propval) nothrow
  {
    (cast(GtkBindingSignal*)this._cPtr).nArgs = propval;
  }
}
