module gtk.shortcut_controller;

import gdk.types;
import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.event_controller;
import gtk.shortcut;
import gtk.types;

/**
    [gtk.shortcut_controller.ShortcutController] is an event controller that manages shortcuts.
  
  Most common shortcuts are using this controller implicitly, e.g. by
  adding a mnemonic underline to a [gtk.label.Label], or by installing a key
  binding using [gtk.widget_class.WidgetClass.addBinding], or by adding accelerators
  to global actions using [gtk.application.Application.setAccelsForAction].
  
  But it is possible to create your own shortcut controller, and add
  shortcuts to it.
  
  [gtk.shortcut_controller.ShortcutController] implements [gio.list_model.ListModel] for querying the
  shortcuts that have been added to it.
  
  # GtkShortcutController as GtkBuildable
  
  [gtk.shortcut_controller.ShortcutController]s can be created in [gtk.builder.Builder] ui files, to set up
  shortcuts in the same place as the widgets.
  
  An example of a UI definition fragment with [gtk.shortcut_controller.ShortcutController]:
  ```xml
    <object class='GtkButton'>
      <child>
        <object class='GtkShortcutController'>
          <property name='scope'>managed</property>
          <child>
            <object class='GtkShortcut'>
              <property name='trigger'>&lt;Control&gt;k</property>
              <property name='action'>activate</property>
            </object>
          </child>
        </object>
      </child>
    </object>
  ```
  
  This example creates a [gtk.activate_action.ActivateAction] for triggering the
  `activate` signal of the [gtk.button.Button]. See [gtk.shortcut_action.ShortcutAction.parseString]
  for the syntax for other kinds of [gtk.shortcut_action.ShortcutAction]. See
  [gtk.shortcut_trigger.ShortcutTrigger.parseString] to learn more about the syntax
  for triggers.
*/
class ShortcutController : gtk.event_controller.EventController, gio.list_model.ListModel, gtk.buildable.Buildable
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_shortcut_controller_get_type != &gidSymbolNotFound ? gtk_shortcut_controller_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin ListModelT!();
  mixin BuildableT!();

  /**
      Creates a new shortcut controller.
    Returns:     a newly created shortcut controller
  */
  this()
  {
    GtkEventController* _cretval;
    _cretval = gtk_shortcut_controller_new();
    this(_cretval, Yes.take);
  }

  /**
      Creates a new shortcut controller that takes its shortcuts from
    the given list model.
    
    A controller created by this function does not let you add or
    remove individual shortcuts using the shortcut controller api,
    but you can change the contents of the model.
    Params:
      model =       a [gio.list_model.ListModel] containing shortcuts
    Returns:     a newly created shortcut controller
  */
  static gtk.shortcut_controller.ShortcutController newForModel(gio.list_model.ListModel model)
  {
    GtkEventController* _cretval;
    _cretval = gtk_shortcut_controller_new_for_model(model ? cast(GListModel*)(cast(ObjectG)model).cPtr(No.dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.shortcut_controller.ShortcutController)(cast(GtkEventController*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Adds shortcut to the list of shortcuts handled by self.
    
    If this controller uses an external shortcut list, this
    function does nothing.
    Params:
      shortcut =       a [gtk.shortcut.Shortcut]
  */
  void addShortcut(gtk.shortcut.Shortcut shortcut)
  {
    gtk_shortcut_controller_add_shortcut(cast(GtkShortcutController*)cPtr, shortcut ? cast(GtkShortcut*)shortcut.cPtr(Yes.dup) : null);
  }

  /**
      Gets the mnemonics modifiers for when this controller activates its shortcuts.
    Returns:     the controller's mnemonics modifiers
  */
  gdk.types.ModifierType getMnemonicsModifiers()
  {
    GdkModifierType _cretval;
    _cretval = gtk_shortcut_controller_get_mnemonics_modifiers(cast(GtkShortcutController*)cPtr);
    gdk.types.ModifierType _retval = cast(gdk.types.ModifierType)_cretval;
    return _retval;
  }

  /**
      Gets the scope for when this controller activates its shortcuts.
    
    See [gtk.shortcut_controller.ShortcutController.setScope] for details.
    Returns:     the controller's scope
  */
  gtk.types.ShortcutScope getScope()
  {
    GtkShortcutScope _cretval;
    _cretval = gtk_shortcut_controller_get_scope(cast(GtkShortcutController*)cPtr);
    gtk.types.ShortcutScope _retval = cast(gtk.types.ShortcutScope)_cretval;
    return _retval;
  }

  /**
      Removes shortcut from the list of shortcuts handled by self.
    
    If shortcut had not been added to controller or this controller
    uses an external shortcut list, this function does nothing.
    Params:
      shortcut =       a [gtk.shortcut.Shortcut]
  */
  void removeShortcut(gtk.shortcut.Shortcut shortcut)
  {
    gtk_shortcut_controller_remove_shortcut(cast(GtkShortcutController*)cPtr, shortcut ? cast(GtkShortcut*)shortcut.cPtr(No.dup) : null);
  }

  /**
      Sets the controller to use the given modifier for mnemonics.
    
    The mnemonics modifiers determines which modifiers need to be pressed to allow
    activation of shortcuts with mnemonics triggers.
    
    GTK normally uses the Alt modifier for mnemonics, except in [gtk.popover_menu.PopoverMenu]s,
    where mnemonics can be triggered without any modifiers. It should be very
    rarely necessary to change this, and doing so is likely to interfere with
    other shortcuts.
    
    This value is only relevant for local shortcut controllers. Global and managed
    shortcut controllers will have their shortcuts activated from other places which
    have their own modifiers for activating mnemonics.
    Params:
      modifiers =       the new mnemonics_modifiers to use
  */
  void setMnemonicsModifiers(gdk.types.ModifierType modifiers)
  {
    gtk_shortcut_controller_set_mnemonics_modifiers(cast(GtkShortcutController*)cPtr, modifiers);
  }

  /**
      Sets the controller to have the given scope.
    
    The scope allows shortcuts to be activated outside of the normal
    event propagation. In particular, it allows installing global
    keyboard shortcuts that can be activated even when a widget does
    not have focus.
    
    With [gtk.types.ShortcutScope.local], shortcuts will only be activated
    when the widget has focus.
    Params:
      scope_ =       the new scope to use
  */
  void setScope(gtk.types.ShortcutScope scope_)
  {
    gtk_shortcut_controller_set_scope(cast(GtkShortcutController*)cPtr, scope_);
  }
}
