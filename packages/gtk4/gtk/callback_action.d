/// Module for [CallbackAction] class
module gtk.callback_action;

import gid.gid;
import glib.variant;
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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_callback_action_get_type != &gidSymbolNotFound ? gtk_callback_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CallbackAction self()
  {
    return this;
  }

  /**
      Create a custom action that calls the given callback when
      activated.
  
      Params:
        callback = the callback to call
      Returns: A new shortcut action
  */
  this(gtk.types.ShortcutFunc callback = null)
  {
    extern(C) gboolean _callbackCallback(GtkWidget* widget, GVariant* args, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.ShortcutFunc*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(void*)widget, No.Take), args ? new glib.variant.Variant(cast(void*)args, No.Take) : null);
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
