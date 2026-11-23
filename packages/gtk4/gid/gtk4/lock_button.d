/// Module for [LockButton] class
module gid.gtk4.lock_button;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.permission;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.actionable;
import gid.gtk4.actionable_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.button;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;

/**
    [gid.gtk4.lock_button.LockButton] is a widget to obtain and revoke authorizations
    needed to operate the controls.
    
    <picture>
      <source srcset="lockbutton-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkLockButton" src="lockbutton.png">
    </picture>
    
    It is typically used in preference dialogs or control panels.
    
    The required authorization is represented by a [gid.gio2.permission.Permission] object.
    Concrete implementations of [gid.gio2.permission.Permission] may use PolicyKit or some
    other authorization framework. To obtain a PolicyKit-based
    [gid.gio2.permission.Permission], use `polkit_permission_new()`.
    
    If the user is not currently allowed to perform the action, but can
    obtain the permission, the widget looks like this:
    
    <picture>
      <source srcset="lockbutton-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An locked GtkLockButton" src="lockbutton.png">
    </picture>
    
    and the user can click the button to request the permission. Depending
    on the platform, this may pop up an authentication dialog or ask the user
    to authenticate in some other way. Once the user has obtained the permission,
    the widget changes to this:
    
    <picture>
      <source srcset="lockbutton-unlocked-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An unlocked GtkLockButton" src="lockbutton-unlocked.png">
    </picture>
    
    and the permission can be dropped again by clicking the button. If the user
    is not able to obtain the permission at all, the widget looks like this:
    
    <picture>
      <source srcset="lockbutton-sorry-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An unobtainable GtkLockButton" src="lockbutton-sorry.png">
    </picture>
    
    If the user has the permission and cannot drop it, the button is hidden.
    
    The text (and tooltips) that are shown in the various cases can be adjusted
    with the [gid.gtk4.lock_button.LockButton.textLock],
    [gid.gtk4.lock_button.LockButton.textUnlock],
    [gid.gtk4.lock_button.LockButton.tooltipLock],
    [gid.gtk4.lock_button.LockButton.tooltipUnlock] and
    [gid.gtk4.lock_button.LockButton.tooltipNotAuthorized] properties.

    Deprecated: This widget will be removed in GTK 5
*/
class LockButton : gid.gtk4.button.Button
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
      Get builder for [gid.gtk4.lock_button.LockButton]
      Returns: New builder object
  */
  static LockButtonGidBuilder builder() nothrow
  {
    return new LockButtonGidBuilder;
  }

  /**
      Get `permission` property.
      Returns: The `GPermission object controlling this button.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property gid.gio2.permission.Permission permission() nothrow
  {
    return getPermission();
  }

  /**
      Set `permission` property.
      Params:
        propval = The `GPermission object controlling this button.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void permission(gid.gio2.permission.Permission propval) nothrow
  {
    setPermission(propval);
  }

  /**
      Get `textLock` property.
      Returns: The text to display when prompting the user to lock.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string textLock() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("text-lock");
  }

  /**
      Set `textLock` property.
      Params:
        propval = The text to display when prompting the user to lock.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void textLock(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("text-lock", propval);
  }

  /**
      Get `textUnlock` property.
      Returns: The text to display when prompting the user to unlock.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string textUnlock() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("text-unlock");
  }

  /**
      Set `textUnlock` property.
      Params:
        propval = The text to display when prompting the user to unlock.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void textUnlock(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("text-unlock", propval);
  }

  /**
      Get `tooltipLock` property.
      Returns: The tooltip to display when prompting the user to lock.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string tooltipLock() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("tooltip-lock");
  }

  /**
      Set `tooltipLock` property.
      Params:
        propval = The tooltip to display when prompting the user to lock.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void tooltipLock(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("tooltip-lock", propval);
  }

  /**
      Get `tooltipNotAuthorized` property.
      Returns: The tooltip to display when the user cannot obtain authorization.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string tooltipNotAuthorized() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("tooltip-not-authorized");
  }

  /**
      Set `tooltipNotAuthorized` property.
      Params:
        propval = The tooltip to display when the user cannot obtain authorization.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void tooltipNotAuthorized(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("tooltip-not-authorized", propval);
  }

  /**
      Get `tooltipUnlock` property.
      Returns: The tooltip to display when prompting the user to unlock.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string tooltipUnlock() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("tooltip-unlock");
  }

  /**
      Set `tooltipUnlock` property.
      Params:
        propval = The tooltip to display when prompting the user to unlock.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void tooltipUnlock(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("tooltip-unlock", propval);
  }

  /**
      Creates a new lock button which reflects the permission.
  
      Params:
        permission = a [gid.gio2.permission.Permission]
      Returns: a new [gid.gtk4.lock_button.LockButton]
  
      Deprecated: This widget will be removed in GTK 5
  */
  this(gid.gio2.permission.Permission permission = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
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
      Obtains the [gid.gio2.permission.Permission] object that controls button.
      Returns: the [gid.gio2.permission.Permission] of button
  
      Deprecated: This widget will be removed in GTK 5
  */
  gid.gio2.permission.Permission getPermission() nothrow
  {
    GPermission* _cretval;
    _cretval = gtk_lock_button_get_permission(cast(GtkLockButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.permission.Permission)(cast(GPermission*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the [gid.gio2.permission.Permission] object that controls button.
  
      Params:
        permission = a [gid.gio2.permission.Permission] object
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setPermission(gid.gio2.permission.Permission permission = null) nothrow
  {
    gtk_lock_button_set_permission(cast(GtkLockButton*)this._cPtr, permission ? cast(GPermission*)permission._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.lock_button.LockButton]
class LockButtonGidBuilderImpl(T) : gid.gtk4.button.ButtonGidBuilderImpl!T
{


  /**
      Set `permission` property.
      Params:
        propval = The `GPermission object controlling this button.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T permission(gid.gio2.permission.Permission propval) nothrow
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
  T textLock(string propval) nothrow
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
  T textUnlock(string propval) nothrow
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
  T tooltipLock(string propval) nothrow
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
  T tooltipNotAuthorized(string propval) nothrow
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
  T tooltipUnlock(string propval) nothrow
  {
    return setProperty("tooltip-unlock", propval);
  }
}

/// Fluent builder for [gid.gtk4.lock_button.LockButton]
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
