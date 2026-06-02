/// Module for [CallbackAction] class
module gtk.callback_action;

public import gid.basictypes;
import gid.gid;
import glib.variant;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.shortcut_action;
import gtk.types;
import gtk.widget;

/**
    A [gtk.shortcut_action.ShortcutAction] that invokes a callback.
*/
class CallbackAction : gtk.shortcut_action.ShortcutAction
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_callback_action_get_type != &gidSymbolNotFound ? gtk_callback_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CallbackAction self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.callback_action.CallbackAction]
      Returns: New builder object
  */
  static CallbackActionGidBuilder builder() nothrow
  {
    return new CallbackActionGidBuilder;
  }

  /**
      Create a custom action that calls the given callback when
      activated.
  
      Params:
        callback = the callback to call
      Returns: A new shortcut action
  */
  this(gtk.types.ShortcutFunc callback = null) nothrow
  {
    extern(C) gboolean _callbackCallback(GtkWidget* widget, GVariant* args, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.ShortcutFunc*)userData;

      try
      {
        _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(void*)widget, No.Take), args ? new glib.variant.Variant(cast(void*)args, No.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gtk.types.ShortcutFunc");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    GtkShortcutAction* _cretval;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    _cretval = gtk_callback_action_new(_callbackCB, _callback, _callbackDestroyCB);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gtk.callback_action.CallbackAction]
class CallbackActionGidBuilderImpl(T) : gtk.shortcut_action.ShortcutActionGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.callback_action.CallbackAction]
final class CallbackActionGidBuilder : CallbackActionGidBuilderImpl!CallbackActionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CallbackAction build() nothrow
  {
    return new CallbackAction(cast(void*)createGObject(CallbackAction._getGType), Yes.Take);
  }
}
