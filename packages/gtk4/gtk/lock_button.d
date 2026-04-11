/// Module for [LockButton] class
module gtk.lock_button;

import gid.gid;
import gio.permission;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;

/**
    [gtk.lock_button.LockButton] is a widget to obtain and revoke authorizations
    needed to operate the controls.
    
    ![An example GtkLockButton](lock-button.png)
    
    It is typically used in preference dialogs or control panels.
    
    The required authorization is represented by a [gio.permission.Permission] object.
    Concrete implementations of [gio.permission.Permission] may use PolicyKit or some
    other authorization framework. To obtain a PolicyKit-based
    [gio.permission.Permission], use `polkit_permission_new()`.
    
    If the user is not currently allowed to perform the action, but can
    obtain the permission, the widget looks like this:
    
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
    with the `property@Gtk.LockButton:text-lock`,
    `property@Gtk.LockButton:text-unlock`,
    `property@Gtk.LockButton:tooltip-lock`,
    `property@Gtk.LockButton:tooltip-unlock` and
    `property@Gtk.LockButton:tooltip-not-authorized` properties.

    Deprecated: This widget will be removed in GTK 5
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

  /**
      Get `permission` property.
      Returns: The `GPermission object controlling this button.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property gio.permission.Permission permission()
  {
    return getPermission();
  }

  /**
      Set `permission` property.
      Params:
        propval = The `GPermission object controlling this button.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void permission(gio.permission.Permission propval)
  {
    setPermission(propval);
  }

  /**
      Get `textLock` property.
      Returns: The text to display when prompting the user to lock.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string textLock()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("text-lock");
  }

  /**
      Set `textLock` property.
      Params:
        propval = The text to display when prompting the user to lock.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void textLock(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("text-lock", propval);
  }

  /**
      Get `textUnlock` property.
      Returns: The text to display when prompting the user to unlock.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string textUnlock()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("text-unlock");
  }

  /**
      Set `textUnlock` property.
      Params:
        propval = The text to display when prompting the user to unlock.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void textUnlock(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("text-unlock", propval);
  }

  /**
      Get `tooltipLock` property.
      Returns: The tooltip to display when prompting the user to lock.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string tooltipLock()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("tooltip-lock");
  }

  /**
      Set `tooltipLock` property.
      Params:
        propval = The tooltip to display when prompting the user to lock.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void tooltipLock(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("tooltip-lock", propval);
  }

  /**
      Get `tooltipNotAuthorized` property.
      Returns: The tooltip to display when the user cannot obtain authorization.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string tooltipNotAuthorized()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("tooltip-not-authorized");
  }

  /**
      Set `tooltipNotAuthorized` property.
      Params:
        propval = The tooltip to display when the user cannot obtain authorization.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void tooltipNotAuthorized(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("tooltip-not-authorized", propval);
  }

  /**
      Get `tooltipUnlock` property.
      Returns: The tooltip to display when prompting the user to unlock.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string tooltipUnlock()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("tooltip-unlock");
  }

  /**
      Set `tooltipUnlock` property.
      Params:
        propval = The tooltip to display when prompting the user to unlock.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void tooltipUnlock(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("tooltip-unlock", propval);
  }

  /**
      Creates a new lock button which reflects the permission.
  
      Params:
        permission = a [gio.permission.Permission]
      Returns: a new [gtk.lock_button.LockButton]
  
      Deprecated: This widget will be removed in GTK 5
  */
  this(gio.permission.Permission permission = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_lock_button_new(permission ? cast(GPermission*)permission._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Obtains the [gio.permission.Permission] object that controls button.
      Returns: the [gio.permission.Permission] of button
  
      Deprecated: This widget will be removed in GTK 5
  */
  gio.permission.Permission getPermission()
  {
    GPermission* _cretval;
    _cretval = gtk_lock_button_get_permission(cast(GtkLockButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.permission.Permission)(cast(GPermission*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the [gio.permission.Permission] object that controls button.
  
      Params:
        permission = a [gio.permission.Permission] object
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setPermission(gio.permission.Permission permission = null)
  {
    gtk_lock_button_set_permission(cast(GtkLockButton*)this._cPtr, permission ? cast(GPermission*)permission._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.lock_button.LockButton]
class LockButtonGidBuilderImpl(T) : gtk.button.ButtonGidBuilderImpl!T
{


  /**
      Set `permission` property.
      Params:
        propval = The `GPermission object controlling this button.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T permission(gio.permission.Permission propval)
  {
    return setProperty("permission", propval);
  }

  /**
      Set `textLock` property.
      Params:
        propval = The text to display when prompting the user to lock.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T textLock(string propval)
  {
    return setProperty("text-lock", propval);
  }

  /**
      Set `textUnlock` property.
      Params:
        propval = The text to display when prompting the user to unlock.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T textUnlock(string propval)
  {
    return setProperty("text-unlock", propval);
  }

  /**
      Set `tooltipLock` property.
      Params:
        propval = The tooltip to display when prompting the user to lock.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T tooltipLock(string propval)
  {
    return setProperty("tooltip-lock", propval);
  }

  /**
      Set `tooltipNotAuthorized` property.
      Params:
        propval = The tooltip to display when the user cannot obtain authorization.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T tooltipNotAuthorized(string propval)
  {
    return setProperty("tooltip-not-authorized", propval);
  }

  /**
      Set `tooltipUnlock` property.
      Params:
        propval = The tooltip to display when prompting the user to unlock.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
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
