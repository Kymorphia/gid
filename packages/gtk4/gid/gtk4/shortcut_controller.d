/// Module for [ShortcutController] class
module gid.gtk4.shortcut_controller;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.types;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.event_controller;
import gid.gtk4.shortcut;
import gid.gtk4.types;

/**
    Manages keyboard shortcuts and their activation.
    
    Most common shortcuts are using this controller implicitly, e.g. by
    adding a mnemonic underline to a [gid.gtk4.label.Label], or by installing a key
    binding using [gid.gtk4.widget_class.WidgetClass.addBinding], or by adding accelerators
    to global actions using [gid.gtk4.application.Application.setAccelsForAction].
    
    But it is possible to create your own shortcut controller, and add
    shortcuts to it.
    
    [gid.gtk4.shortcut_controller.ShortcutController] implements [gid.gio2.list_model.ListModel] for querying the
    shortcuts that have been added to it.
    
    # GtkShortcutController as GtkBuildable
    
    [gid.gtk4.shortcut_controller.ShortcutController]s can be created in [gid.gtk4.builder.Builder] ui files, to set up
    shortcuts in the same place as the widgets.
    
    An example of a UI definition fragment with [gid.gtk4.shortcut_controller.ShortcutController]:
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
    
    This example creates a [gid.gtk4.activate_action.ActivateAction] for triggering the
    `activate` signal of the [gid.gtk4.button.Button]. See [gid.gtk4.shortcut_action.ShortcutAction.parseString]
    for the syntax for other kinds of [gid.gtk4.shortcut_action.ShortcutAction]. See
    [gid.gtk4.shortcut_trigger.ShortcutTrigger.parseString] to learn more about the syntax
    for triggers.
*/
class ShortcutController : gid.gtk4.event_controller.EventController, gid.gio2.list_model.ListModel, gid.gtk4.buildable.Buildable
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
    return cast(void function())gtk_shortcut_controller_get_type != &gidSymbolNotFound ? gtk_shortcut_controller_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkShortcutController";
  }

  /** Returns `this`, for use in `with` statements. */
  override ShortcutController self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.shortcut_controller.ShortcutController]
      Returns: New builder object
  */
  static ShortcutControllerGidBuilder builder() nothrow
  {
    return new ShortcutControllerGidBuilder;
  }

  /**
      Get `itemType` property.
      Returns: The type of items. See [gid.gio2.list_model.ListModel.getItemType].
  */
  @property gid.gobject2.types.GType itemType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gobject2.types.GType)("item-type");
  }

  /**
      Get `mnemonicModifiers` property.
      Returns: The modifiers that need to be pressed to allow mnemonics activation.
  */
  @property gid.gdk4.types.ModifierType mnemonicModifiers() nothrow
  {
    return getMnemonicsModifiers();
  }

  /**
      Set `mnemonicModifiers` property.
      Params:
        propval = The modifiers that need to be pressed to allow mnemonics activation.
  */
  @property void mnemonicModifiers(gid.gdk4.types.ModifierType propval) nothrow
  {
    setMnemonicsModifiers(propval);
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gid.gio2.list_model.ListModel.getNItems].
  */
  @property uint nItems() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  /**
      Get `scope_` property.
      Returns: What scope the shortcuts will be handled in.
  */
  @property gid.gtk4.types.ShortcutScope scope_() nothrow
  {
    return getScope();
  }

  /**
      Set `scope_` property.
      Params:
        propval = What scope the shortcuts will be handled in.
  */
  @property void scope_(gid.gtk4.types.ShortcutScope propval) nothrow
  {
    setScope(propval);
  }

  mixin ListModelT!();
  mixin BuildableT!();

  /**
      Creates a new shortcut controller.
      Returns: a newly created shortcut controller
  */
  this() nothrow
  {
    GtkEventController* _cretval;
    _cretval = gtk_shortcut_controller_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new shortcut controller that takes its shortcuts from
      the given list model.
      
      A controller created by this function does not let you add or
      remove individual shortcuts using the shortcut controller api,
      but you can change the contents of the model.
  
      Params:
        model = a [gid.gio2.list_model.ListModel] containing shortcuts
      Returns: a newly created shortcut controller
  */
  static gid.gtk4.shortcut_controller.ShortcutController newForModel(gid.gio2.list_model.ListModel model) nothrow
  {
    GtkEventController* _cretval;
    _cretval = gtk_shortcut_controller_new_for_model(model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.shortcut_controller.ShortcutController)(cast(GtkEventController*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Adds shortcut to the list of shortcuts handled by self.
      
      If this controller uses an external shortcut list, this
      function does nothing.
  
      Params:
        shortcut = a [gid.gtk4.shortcut.Shortcut]
  */
  void addShortcut(gid.gtk4.shortcut.Shortcut shortcut) nothrow
  {
    gtk_shortcut_controller_add_shortcut(cast(GtkShortcutController*)this._cPtr, shortcut ? cast(GtkShortcut*)shortcut._cPtr(Yes.Dup) : null);
  }

  /**
      Gets the mnemonics modifiers for when this controller activates its shortcuts.
      Returns: the controller's mnemonics modifiers
  */
  gid.gdk4.types.ModifierType getMnemonicsModifiers() nothrow
  {
    GdkModifierType _cretval;
    _cretval = gtk_shortcut_controller_get_mnemonics_modifiers(cast(GtkShortcutController*)this._cPtr);
    gid.gdk4.types.ModifierType _retval = cast(gid.gdk4.types.ModifierType)_cretval;
    return _retval;
  }

  /**
      Gets the scope for when this controller activates its shortcuts.
      
      See [gid.gtk4.shortcut_controller.ShortcutController.setScope] for details.
      Returns: the controller's scope
  */
  gid.gtk4.types.ShortcutScope getScope() nothrow
  {
    GtkShortcutScope _cretval;
    _cretval = gtk_shortcut_controller_get_scope(cast(GtkShortcutController*)this._cPtr);
    gid.gtk4.types.ShortcutScope _retval = cast(gid.gtk4.types.ShortcutScope)_cretval;
    return _retval;
  }

  /**
      Removes shortcut from the list of shortcuts handled by self.
      
      If shortcut had not been added to controller or this controller
      uses an external shortcut list, this function does nothing.
  
      Params:
        shortcut = a [gid.gtk4.shortcut.Shortcut]
  */
  void removeShortcut(gid.gtk4.shortcut.Shortcut shortcut) nothrow
  {
    gtk_shortcut_controller_remove_shortcut(cast(GtkShortcutController*)this._cPtr, shortcut ? cast(GtkShortcut*)shortcut._cPtr(No.Dup) : null);
  }

  /**
      Sets the controller to use the given modifier for mnemonics.
      
      The mnemonics modifiers determines which modifiers need to be pressed to allow
      activation of shortcuts with mnemonics triggers.
      
      GTK normally uses the Alt modifier for mnemonics, except in [gid.gtk4.popover_menu.PopoverMenu]s,
      where mnemonics can be triggered without any modifiers. It should be very
      rarely necessary to change this, and doing so is likely to interfere with
      other shortcuts.
      
      This value is only relevant for local shortcut controllers. Global and managed
      shortcut controllers will have their shortcuts activated from other places which
      have their own modifiers for activating mnemonics.
  
      Params:
        modifiers = the new mnemonics_modifiers to use
  */
  void setMnemonicsModifiers(gid.gdk4.types.ModifierType modifiers) nothrow
  {
    gtk_shortcut_controller_set_mnemonics_modifiers(cast(GtkShortcutController*)this._cPtr, modifiers);
  }

  /**
      Sets the controller to have the given scope.
      
      The scope allows shortcuts to be activated outside of the normal
      event propagation. In particular, it allows installing global
      keyboard shortcuts that can be activated even when a widget does
      not have focus.
      
      With [gid.gtk4.types.ShortcutScope.Local], shortcuts will only be activated
      when the widget has focus.
  
      Params:
        scope_ = the new scope to use
  */
  void setScope(gid.gtk4.types.ShortcutScope scope_) nothrow
  {
    gtk_shortcut_controller_set_scope(cast(GtkShortcutController*)this._cPtr, scope_);
  }
}

/// Fluent builder implementation template for [gid.gtk4.shortcut_controller.ShortcutController]
class ShortcutControllerGidBuilderImpl(T) : gid.gtk4.event_controller.EventControllerGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T, gid.gtk4.buildable.BuildableGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
  mixin BuildableGidBuilderT!();

  /**
      Set `mnemonicModifiers` property.
      Params:
        propval = The modifiers that need to be pressed to allow mnemonics activation.
      Returns: Builder instance for fluent chaining
  */
  T mnemonicModifiers(gid.gdk4.types.ModifierType propval) nothrow
  {
    return setProperty("mnemonic-modifiers", propval);
  }

  /**
      Set `model` property.
      Params:
        propval = A list model to take shortcuts from.
      Returns: Builder instance for fluent chaining
  */
  T model(gid.gio2.list_model.ListModel propval) nothrow
  {
    return setProperty("model", propval);
  }

  /**
      Set `scope_` property.
      Params:
        propval = What scope the shortcuts will be handled in.
      Returns: Builder instance for fluent chaining
  */
  T scope_(gid.gtk4.types.ShortcutScope propval) nothrow
  {
    return setProperty("scope", propval);
  }
}

/// Fluent builder for [gid.gtk4.shortcut_controller.ShortcutController]
final class ShortcutControllerGidBuilder : ShortcutControllerGidBuilderImpl!ShortcutControllerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ShortcutController build() nothrow
  {
    return new ShortcutController(cast(void*)createGObject(ShortcutController._getGType), Yes.Take);
  }
}
