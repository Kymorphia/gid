/// Module for [Notification] class
module gio.notification;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.icon;
import gio.types;
import glib.variant;
import gobject.gid_builder;
import gobject.object;

/**
    [gio.notification.Notification] is a mechanism for creating a notification to be shown
    to the user — typically as a pop-up notification presented by the
    desktop environment shell.
    
    The key difference between [gio.notification.Notification] and other similar APIs is
    that, if supported by the desktop environment, notifications sent
    with [gio.notification.Notification] will persist after the application has exited,
    and even across system reboots.
    
    Since the user may click on a notification while the application is
    not running, applications using [gio.notification.Notification] should be able to be
    started as a D-Bus service, using [gio.application.Application].
    
    In order for [gio.notification.Notification] to work, the application must have installed
    a `.desktop` file. For example:
    ```
    [Desktop Entry]
    Name=Test Application
    Comment=Description of what Test Application does
    Exec=gnome-test-application
    Icon=org.gnome.TestApplication
    Terminal=false
    Type=Application
    Categories=GNOME;GTK;TestApplication Category;
    StartupNotify=true
    DBusActivatable=true
    X-GNOME-UsesNotifications=true
    ```
    
    The `X-GNOME-UsesNotifications` key indicates to GNOME Control Center
    that this application uses notifications, so it can be listed in the
    Control Center’s ‘Notifications’ panel.
    
    The `.desktop` file must be named as `org.gnome.TestApplication.desktop`,
    where `org.gnome.TestApplication` is the ID passed to
    [gio.application.Application.new_].
    
    User interaction with a notification (either the default action, or
    buttons) must be associated with actions on the application (ie:
    `app.` actions).  It is not possible to route user interaction
    through the notification itself, because the object will not exist if
    the application is autostarted as a result of a notification being
    clicked.
    
    A notification can be sent with [gio.application.Application.sendNotification].
*/
class Notification : gobject.object.ObjectWrap
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
    return cast(void function())g_notification_get_type != &gidSymbolNotFound ? g_notification_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Notification self()
  {
    return this;
  }

  /**
  Get builder for [gio.notification.Notification]
  Returns: New builder object
  */
  static NotificationGidBuilder builder()
  {
    return new NotificationGidBuilder;
  }

  /**
      Creates a new #GNotification with title as its title.
      
      After populating notification with more details, it can be sent to
      the desktop shell with [gio.application.Application.sendNotification]. Changing
      any properties after this call will not have any effect until
      resending notification.
  
      Params:
        title = the title of the notification
      Returns: a new #GNotification instance
  */
  this(string title)
  {
    GNotification* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = g_notification_new(_title);
    this(_cretval, Yes.Take);
  }

  /**
      Adds a button to notification that activates the action in
      detailed_action when clicked. That action must be an
      application-wide action (starting with "app."). If detailed_action
      contains a target, the action will be activated with that target as
      its parameter.
      
      See [gio.action.Action.parseDetailedName] for a description of the format
      for detailed_action.
  
      Params:
        label = label of the button
        detailedAction = a detailed action name
  */
  void addButton(string label, string detailedAction)
  {
    const(char)* _label = label.toCString(No.Alloc);
    const(char)* _detailedAction = detailedAction.toCString(No.Alloc);
    g_notification_add_button(cast(GNotification*)this._cPtr, _label, _detailedAction);
  }

  /**
      Adds a button to notification that activates action when clicked.
      action must be an application-wide action (it must start with "app.").
      
      If target is non-null, action will be activated with target as
      its parameter.
  
      Params:
        label = label of the button
        action = an action name
        target = a #GVariant to use as action's parameter, or null
  */
  void addButtonWithTarget(string label, string action, glib.variant.Variant target = null)
  {
    const(char)* _label = label.toCString(No.Alloc);
    const(char)* _action = action.toCString(No.Alloc);
    g_notification_add_button_with_target_value(cast(GNotification*)this._cPtr, _label, _action, target ? cast(GVariant*)target._cPtr(No.Dup) : null);
  }

  /**
      Sets the body of notification to body.
  
      Params:
        body_ = the new body for notification, or null
  */
  void setBody(string body_ = null)
  {
    const(char)* _body_ = body_.toCString(No.Alloc);
    g_notification_set_body(cast(GNotification*)this._cPtr, _body_);
  }

  /**
      Sets the type of notification to category. Categories have a main
      type like `email`, `im` or `device` and can have a detail separated
      by a `.`, e.g. `im.received` or `email.arrived`. Setting the category
      helps the notification server to select proper feedback to the user.
      
      Standard categories are [listed in the specification](https://specifications.freedesktop.org/notification-spec/latest/ar01s06.html).
  
      Params:
        category = the category for notification, or null for no category
  */
  void setCategory(string category = null)
  {
    const(char)* _category = category.toCString(No.Alloc);
    g_notification_set_category(cast(GNotification*)this._cPtr, _category);
  }

  /**
      Sets the default action of notification to detailed_action. This
      action is activated when the notification is clicked on.
      
      The action in detailed_action must be an application-wide action (it
      must start with "app."). If detailed_action contains a target, the
      given action will be activated with that target as its parameter.
      See [gio.action.Action.parseDetailedName] for a description of the format
      for detailed_action.
      
      When no default action is set, the application that the notification
      was sent on is activated.
  
      Params:
        detailedAction = a detailed action name
  */
  void setDefaultAction(string detailedAction)
  {
    const(char)* _detailedAction = detailedAction.toCString(No.Alloc);
    g_notification_set_default_action(cast(GNotification*)this._cPtr, _detailedAction);
  }

  /**
      Sets the default action of notification to action. This action is
      activated when the notification is clicked on. It must be an
      application-wide action (start with "app.").
      
      If target is non-null, action will be activated with target as
      its parameter. If target is floating, it will be consumed.
      
      When no default action is set, the application that the notification
      was sent on is activated.
  
      Params:
        action = an action name
        target = a #GVariant to use as action's parameter, or null
  */
  void setDefaultActionAndTarget(string action, glib.variant.Variant target = null)
  {
    const(char)* _action = action.toCString(No.Alloc);
    g_notification_set_default_action_and_target_value(cast(GNotification*)this._cPtr, _action, target ? cast(GVariant*)target._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon of notification to icon.
  
      Params:
        icon = the icon to be shown in notification, as a #GIcon
  */
  void setIcon(gio.icon.Icon icon)
  {
    g_notification_set_icon(cast(GNotification*)this._cPtr, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Sets the priority of notification to priority. See
      #GNotificationPriority for possible values.
  
      Params:
        priority = a #GNotificationPriority
  */
  void setPriority(gio.types.NotificationPriority priority)
  {
    g_notification_set_priority(cast(GNotification*)this._cPtr, priority);
  }

  /**
      Sets the title of notification to title.
  
      Params:
        title = the new title for notification
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    g_notification_set_title(cast(GNotification*)this._cPtr, _title);
  }

  /**
      Deprecated in favor of [gio.notification.Notification.setPriority].
  
      Params:
        urgent = true if notification is urgent
  
      Deprecated: Since 2.42, this has been deprecated in favour of
           [gio.notification.Notification.setPriority].
  */
  void setUrgent(bool urgent)
  {
    g_notification_set_urgent(cast(GNotification*)this._cPtr, urgent);
  }
}

class NotificationGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gio.notification.Notification]
final class NotificationGidBuilder : NotificationGidBuilderImpl!NotificationGidBuilder
{
  Notification build()
  {
    return new Notification(cast(void*)createGObject(Notification._getGType), Yes.Take);
  }
}
