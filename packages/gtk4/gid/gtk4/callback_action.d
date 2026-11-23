/// Module for [CallbackAction] class
module gid.gtk4.callback_action;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.variant;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.shortcut_action;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Invokes a callback.
*/
class CallbackAction : gid.gtk4.shortcut_action.ShortcutAction
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_callback_action_get_type != &gidSymbolNotFound ? gtk_callback_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCallbackAction";
  }

  /** Returns `this`, for use in `with` statements. */
  override CallbackAction self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.callback_action.CallbackAction]
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
        callback = the callback
            to call when the action is activated
      Returns: A new shortcut action
  */
  this(gid.gtk4.types.ShortcutFunc callback) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      extern(C) gboolean _callbackCallback(GtkWidget* widget, GVariant* args, void* userData) nothrow
      {
        gidAttachThread();
        bool _dretval;
        auto _dlg = cast(gid.gtk4.types.ShortcutFunc*)userData;

        try
        {
          _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), args ? new gid.glib2.variant.Variant(cast(void*)args, No.Take) : null);
        }
        catch (Exception e)
        {
          gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.ShortcutFunc");
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
}

/// Fluent builder implementation template for [gid.gtk4.callback_action.CallbackAction]
class CallbackActionGidBuilderImpl(T) : gid.gtk4.shortcut_action.ShortcutActionGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.callback_action.CallbackAction]
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
