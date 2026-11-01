/// Module for [ShortcutsDialog] class
module adw.shortcuts_dialog;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.dialog;
import adw.shortcuts_section;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;

/**
    A dialog that displays application's keyboard shortcuts.
    
    <picture>
      <source srcset="shortcuts-dialog-dark.png" media="(prefers-color-scheme: dark)">
      <img src="shortcuts-dialog.png" alt="shortcuts-dialog">
    </picture>
    
    Shortcuts are grouped into sections, represented by [adw.shortcuts_section.ShortcutsSection]
    objects. Each section has one or more items, represented by
    [adw.shortcuts_item.ShortcutsItem] objects.
    
    To add a section to the dialog, use [adw.shortcuts_dialog.ShortcutsDialog.add], or add it
    as a child when using UI files.
    
    Sections without titles can be used to further subdivide each section into
    groups.
    
    Example of an [adw.shortcuts_dialog.ShortcutsDialog] UI definition:
    
    ```xml
    <object class="AdwShortcutsDialog" id="shortcuts_dialog">
      <child>
        <object class="AdwShortcutsSection">
          <property name="title" translatable="yes">General</property>
          <child>
            <object class="AdwShortcutsItem">
              <property name="title" translatable="yes">Open Menu</property>
              <property name="accelerator">F10</property>
            </object>
          </child>
          <child>
            <object class="AdwShortcutsItem">
              <property name="title" translatable="yes">Quit</property>
              <property name="action-name">app.quit</property>
            </object>
          </child>
        </object>
      </child>
      <child>
        <object class="AdwShortcutsSection">
          <child>
            <object class="AdwShortcutsItem">
              <property name="title" translatable="yes">Move Tab Left</property>
              <property name="accelerator">&lt;Shift&gt;&lt;Ctrl&gt;Page_Up</property>
              <property name="direction">ltr</property>
            </object>
          </child>
          <child>
            <object class="AdwShortcutsItem">
              <property name="title" translatable="yes">Move Tab Right</property>
              <property name="accelerator">&lt;Shift&gt;&lt;Ctrl&gt;Page_Down</property>
              <property name="direction">ltr</property>
            </object>
          </child>
          <child>
            <object class="AdwShortcutsItem">
              <property name="title" translatable="yes">Move Tab Right</property>
              <property name="accelerator">&lt;Shift&gt;&lt;Ctrl&gt;Page_Up</property>
              <property name="direction">rtl</property>
            </object>
          </child>
          <child>
            <object class="AdwShortcutsItem">
              <property name="title" translatable="yes">Move Tab Left</property>
              <property name="accelerator">&lt;Shift&gt;&lt;Ctrl&gt;Page_Down</property>
              <property name="direction">rtl</property>
            </object>
          </child>
        </object>
      </child>
    </object>
    ```
    
    If the `app.quit` action has the <kbd>Ctrl</kbd><kbd>Q</kbd> accelerator
    associated with it, the result will look as follows:
    
    <picture>
      <source srcset="shortcuts-dialog-example-dark.png" media="(prefers-color-scheme: dark)">
      <img src="shortcuts-dialog-example.png" alt="shortcuts-dialog-example">
    </picture>
    
    The recommended way to use [adw.shortcuts_dialog.ShortcutsDialog] is via [adw.application.Application]'s
    automatic resource loading.
    
    See also: [adw.shortcut_label.ShortcutLabel].
*/
class ShortcutsDialog : adw.dialog.Dialog
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_shortcuts_dialog_get_type != &gidSymbolNotFound ? adw_shortcuts_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ShortcutsDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.shortcuts_dialog.ShortcutsDialog]
      Returns: New builder object
  */
  static ShortcutsDialogGidBuilder builder() nothrow
  {
    return new ShortcutsDialogGidBuilder;
  }

  /**
      Creates a new [adw.shortcuts_dialog.ShortcutsDialog].
      Returns: the newly created [adw.shortcuts_dialog.ShortcutsDialog]
  */
  this() nothrow
  {
    AdwDialog* _cretval;
    _cretval = adw_shortcuts_dialog_new();
    this(_cretval, No.Take);
  }

  /**
      Adds section to self.
  
      Params:
        section = the section to add
  */
  void add(adw.shortcuts_section.ShortcutsSection section) nothrow
  {
    adw_shortcuts_dialog_add(cast(AdwShortcutsDialog*)this._cPtr, section ? cast(AdwShortcutsSection*)section._cPtr(Yes.Dup) : null);
  }
}

/// Fluent builder implementation template for [adw.shortcuts_dialog.ShortcutsDialog]
class ShortcutsDialogGidBuilderImpl(T) : adw.dialog.DialogGidBuilderImpl!T
{

}

/// Fluent builder for [adw.shortcuts_dialog.ShortcutsDialog]
final class ShortcutsDialogGidBuilder : ShortcutsDialogGidBuilderImpl!ShortcutsDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ShortcutsDialog build() nothrow
  {
    return new ShortcutsDialog(cast(void*)createGObject(ShortcutsDialog._getGType), Yes.Take);
  }
}
