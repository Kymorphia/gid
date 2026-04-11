/// Module for [LockButton] class
module gtk.lock_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gio.permission;
import gobject.gid_builder;
import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    GtkLockButton is a widget that can be used in control panels or
    preference dialogs to allow users to obtain and revoke authorizations
    needed to operate the controls. The required authorization is represented
    by a #GPermission object. Concrete implementations of #GPermission may use
    PolicyKit or some other authorization framework. To obtain a PolicyKit-based
    #GPermission, use polkit_permission_new().
    
    If the user is not currently allowed to perform the action, but can obtain
    the permission, the widget looks like this:
    
    ![](lockbutton-locked.png)
    
    and the user can click the button to request the permission. Depending
    on the platform, this may pop up an authentication dialog or ask the user
    to authenticate in some other way. Once the user has obtained the permission,
    the widget changes to this:
    
    ![](lockbutton-unlocked.png)
    
    and the permission can be dropped again by clicking the button. If the user
    is not able to obtain the permission at all, the widget looks like this:
    
    ![](lockbutton-sorry.png)
    
    If the user has the permission and cannot drop it, the button is hidden.
    
    The text (and tooltips) that are shown in the various cases can be adjusted
    with the #GtkLockButton:text-lock, #GtkLockButton:text-unlock,
    #GtkLockButton:tooltip-lock, #GtkLockButton:tooltip-unlock and
    #GtkLockButton:tooltip-not-authorized properties.
*/
class LockButton : gtk.button.Button
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
    return cast(void function())gtk_lock_button_get_type != &gidSymbolNotFound ? gtk_lock_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LockButton self()
  {
    return this;
  }

  /**
      Get builder for [gtk.lock_button.LockButton]
      Returns: New builder object
  */
  static LockButtonGidBuilder builder()
  {
    return new LockButtonGidBuilder;
  }

  /** */
  @property gio.permission.Permission permission()
  {
    return getPermission();
  }

  /** */
  @property void permission(gio.permission.Permission propval)
  {
    setPermission(propval);
  }

  /** */
  @property string textLock()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("text-lock");
  }

  /** */
  @property void textLock(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("text-lock", propval);
  }

  /** */
  @property string textUnlock()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("text-unlock");
  }

  /** */
  @property void textUnlock(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("text-unlock", propval);
  }

  /** */
  @property string tooltipLock()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("tooltip-lock");
  }

  /** */
  @property void tooltipLock(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("tooltip-lock", propval);
  }

  /** */
  @property string tooltipNotAuthorized()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("tooltip-not-authorized");
  }

  /** */
  @property void tooltipNotAuthorized(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("tooltip-not-authorized", propval);
  }

  /** */
  @property string tooltipUnlock()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("tooltip-unlock");
  }

  /** */
  @property void tooltipUnlock(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("tooltip-unlock", propval);
  }

  /**
      Creates a new lock button which reflects the permission.
  
      Params:
        permission = a #GPermission
      Returns: a new #GtkLockButton
  */
  this(gio.permission.Permission permission = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_lock_button_new(permission ? cast(GPermission*)permission._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Obtains the #GPermission object that controls button.
      Returns: the #GPermission of button
  */
  gio.permission.Permission getPermission()
  {
    GPermission* _cretval;
    _cretval = gtk_lock_button_get_permission(cast(GtkLockButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.permission.Permission)(cast(GPermission*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the #GPermission object that controls button.
  
      Params:
        permission = a #GPermission object, or null
  */
  void setPermission(gio.permission.Permission permission = null)
  {
    gtk_lock_button_set_permission(cast(GtkLockButton*)this._cPtr, permission ? cast(GPermission*)permission._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.lock_button.LockButton]
class LockButtonGidBuilderImpl(T) : gtk.button.ButtonGidBuilderImpl!T
{


  /** */
  T permission(gio.permission.Permission propval)
  {
    return setProperty("permission", propval);
  }

  /** */
  T textLock(string propval)
  {
    return setProperty("text-lock", propval);
  }

  /** */
  T textUnlock(string propval)
  {
    return setProperty("text-unlock", propval);
  }

  /** */
  T tooltipLock(string propval)
  {
    return setProperty("tooltip-lock", propval);
  }

  /** */
  T tooltipNotAuthorized(string propval)
  {
    return setProperty("tooltip-not-authorized", propval);
  }

  /** */
  T tooltipUnlock(string propval)
  {
    return setProperty("tooltip-unlock", propval);
  }
}

/// Fluent builder for [gtk.lock_button.LockButton]
final class LockButtonGidBuilder : LockButtonGidBuilderImpl!LockButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LockButton build()
  {
    return new LockButton(cast(void*)createGObject(LockButton._getGType), No.Take);
  }
}
