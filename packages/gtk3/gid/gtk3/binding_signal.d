/// Module for [BindingSignal] class
module gid.gtk3.binding_signal;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gtk3.binding_arg;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/**
    A GtkBindingSignal stores the necessary information to
    activate a widget in response to a key press via a signal
    emission.
*/
class BindingSignal : StructWrap!(GtkBindingSignal)
{
  /**
      Create a `binding_signal.BindingSignal` wrap type.
      Params:
        signalName = the action signal to be emitted
  */
  this(string signalName = string.init) nothrow
  {
    this.signalName = signalName;
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

  /**
      Get `next` field.
      Returns: implementation detail
  */
  @property gid.gtk3.binding_signal.BindingSignal next() nothrow
  {
    return (cast(GtkBindingSignal*)this._cPtr).next ? new gid.gtk3.binding_signal.BindingSignal(cast(GtkBindingSignal*)(cast(GtkBindingSignal*)this._cPtr).next, this) : null;
  }

  private const(char)* _signalNameRef; // Keeps borrowed GC string alive

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
    if (_refuseBorrowedStore("signalName"))
      return;

    _signalNameRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkBindingSignal*)this._cPtr).signalName = cast(char*)_signalNameRef;
  }

  /**
      Get `args` field.
      Returns: the arguments specified for the signal
  */
  @property gid.gtk3.binding_arg.BindingArg[] args() nothrow
  {
    if (!(cast(GtkBindingSignal*)this._cPtr).args)
      return null;

    auto _retval = new gid.gtk3.binding_arg.BindingArg[]((cast(GtkBindingSignal*)this._cPtr).nArgs);
    foreach (i; 0 .. (cast(GtkBindingSignal*)this._cPtr).nArgs)
      _retval[i] = new gid.gtk3.binding_arg.BindingArg(cast(void*)&(cast(GtkBindingSignal*)this._cPtr).args[i], No.Take);
    return _retval;
  }
}
