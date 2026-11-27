/// Module for [LockButton] class
module gid.gtk3.lock_button;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gio2.permission;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.actionable;
import gid.gtk3.actionable_mixin;
import gid.gtk3.activatable;
import gid.gtk3.activatable_mixin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.button;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

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
@gidGir("LockButton", "LockButtonClass")
class LockButton : gid.gtk3.button.Button
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_lock_button_get_type != &gidSymbolNotFound ? gtk_lock_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkLockButton";
  }

  /** Returns `this`, for use in `with` statements. */
  override LockButton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.lock_button.LockButton]
      Returns: New builder object
  */
  static LockButtonGidBuilder builder() nothrow
  {
    return new LockButtonGidBuilder;
  }

  /** */
  @property gid.gio2.permission.Permission permission() nothrow
  {
    return getPermission();
  }

  /** */
  @property void permission(gid.gio2.permission.Permission propval) nothrow
  {
    setPermission(propval);
  }

  /** */
  @property string textLock() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("text-lock");
  }

  /** */
  @property void textLock(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("text-lock", propval);
  }

  /** */
  @property string textUnlock() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("text-unlock");
  }

  /** */
  @property void textUnlock(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("text-unlock", propval);
  }

  /** */
  @property string tooltipLock() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("tooltip-lock");
  }

  /** */
  @property void tooltipLock(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("tooltip-lock", propval);
  }

  /** */
  @property string tooltipNotAuthorized() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("tooltip-not-authorized");
  }

  /** */
  @property void tooltipNotAuthorized(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("tooltip-not-authorized", propval);
  }

  /** */
  @property string tooltipUnlock() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("tooltip-unlock");
  }

  /** */
  @property void tooltipUnlock(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("tooltip-unlock", propval);
  }

  /**
      Creates a new lock button which reflects the permission.
  
      Params:
        permission = a #GPermission
      Returns: a new #GtkLockButton
  */
  this(gid.gio2.permission.Permission permission = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, permission !is null), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_lock_button_new(permission ? cast(GPermission*)permission._cPtr(No.Dup) : null);
      this(_cretval, No.Take);
    }
  }

  /**
      Obtains the #GPermission object that controls button.
      Returns: the #GPermission of button
  */
  gid.gio2.permission.Permission getPermission() nothrow
  {
    GPermission* _cretval;
    _cretval = gtk_lock_button_get_permission(cast(GtkLockButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.permission.Permission)(cast(GPermission*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the #GPermission object that controls button.
  
      Params:
        permission = a #GPermission object, or null
  */
  void setPermission(gid.gio2.permission.Permission permission = null) nothrow
  {
    gtk_lock_button_set_permission(cast(GtkLockButton*)this._cPtr, permission ? cast(GPermission*)permission._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk3.lock_button.LockButton]
class LockButtonGidBuilderImpl(T) : gid.gtk3.button.ButtonGidBuilderImpl!T
{


  /** */
  T permission(gid.gio2.permission.Permission propval) nothrow
  {
    return setProperty("permission", propval);
  }

  /** */
  T textLock(string propval) nothrow
  {
    return setProperty("text-lock", propval);
  }

  /** */
  T textUnlock(string propval) nothrow
  {
    return setProperty("text-unlock", propval);
  }

  /** */
  T tooltipLock(string propval) nothrow
  {
    return setProperty("tooltip-lock", propval);
  }

  /** */
  T tooltipNotAuthorized(string propval) nothrow
  {
    return setProperty("tooltip-not-authorized", propval);
  }

  /** */
  T tooltipUnlock(string propval) nothrow
  {
    return setProperty("tooltip-unlock", propval);
  }
}

/// Fluent builder for [gid.gtk3.lock_button.LockButton]
final class LockButtonGidBuilder : LockButtonGidBuilderImpl!LockButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LockButton build() nothrow
  {
    return new LockButton(cast(void*)createGObject(LockButton._getGType), Yes.Take);
  }
}
