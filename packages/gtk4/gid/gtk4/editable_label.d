/// Module for [EditableLabel] class
module gid.gtk4.editable_label;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.editable;
import gid.gtk4.editable_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Allows users to edit the displayed text by switching to an “edit mode”.
    
    <picture>
      <source srcset="editable-label-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkEditableLabel" src="editable-label.png">
    </picture>
    
    [gid.gtk4.editable_label.EditableLabel] does not have API of its own, but it
    implements the [gid.gtk4.editable.Editable] interface.
    
    The default bindings for activating the edit mode is
    to click or press the Enter key. The default bindings
    for leaving the edit mode are the Enter key (to save
    the results) or the Escape key (to cancel the editing).
    
    # Shortcuts and Gestures
    
    [gid.gtk4.editable_label.EditableLabel] supports the following keyboard shortcuts:
    
    - <kbd>Enter</kbd> starts editing.
    - <kbd>Escape</kbd> stops editing.
    
    # Actions
    
    [gid.gtk4.editable_label.EditableLabel] defines a set of built-in actions:
    
    - `editing.starts` switches the widget into editing mode.
    - `editing.stop` switches the widget out of editing mode.
    
    # CSS nodes
    
    ```
    editablelabel[.editing]
    ╰── stack
        ├── label
        ╰── text
    ```
    
    [gid.gtk4.editable_label.EditableLabel] has a main node with the name editablelabel.
    When the entry is in editing mode, it gets the .editing style
    class.
    
    For all the subnodes added to the text node in various situations,
    see [gid.gtk4.text.Text].
*/
@gidGir("EditableLabel", "EditableLabelClass")
class EditableLabel : gid.gtk4.widget.Widget, gid.gtk4.editable.Editable
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
    return cast(void function())gtk_editable_label_get_type != &gidSymbolNotFound ? gtk_editable_label_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkEditableLabel";
  }

  /** Returns `this`, for use in `with` statements. */
  override EditableLabel self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.editable_label.EditableLabel]
      Returns: New builder object
  */
  static EditableLabelGidBuilder builder() nothrow
  {
    return new EditableLabelGidBuilder;
  }

  /**
      Get `editing` property.
      Returns: This property is true while the widget is in edit mode.
  */
  @property bool editing() nothrow
  {
    return getEditing();
  }

  /**
      Set `editing` property.
      Params:
        propval = This property is true while the widget is in edit mode.
  */
  @property void editing(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("editing", propval);
  }

  mixin EditableT!();

  /**
      Creates a new [gid.gtk4.editable_label.EditableLabel] widget.
  
      Params:
        str = the text for the label
      Returns: the new [gid.gtk4.editable_label.EditableLabel]
  */
  this(string str) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
      _cretval = gtk_editable_label_new(_str);
      this(_cretval, No.Take);
    }
  }

  /**
      Returns whether the label is currently in “editing mode”.
      Returns: true if self is currently in editing mode
  */
  bool getEditing() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_editable_label_get_editing(cast(GtkEditableLabel*)this._cPtr);
    return _retval;
  }

  /**
      Switches the label into “editing mode”.
  */
  void startEditing() nothrow
  {
    gtk_editable_label_start_editing(cast(GtkEditableLabel*)this._cPtr);
  }

  /**
      Switches the label out of “editing mode”.
      
      If commit is true, the resulting text is kept as the
      [gid.gtk4.editable.Editable.text] property value, otherwise the
      resulting text is discarded and the label will keep its
      previous [gid.gtk4.editable.Editable.text] property value.
  
      Params:
        commit = whether to set the edited text on the label
  */
  void stopEditing(bool commit) nothrow
  {
    gtk_editable_label_stop_editing(cast(GtkEditableLabel*)this._cPtr, commit);
  }
}

/// Fluent builder implementation template for [gid.gtk4.editable_label.EditableLabel]
class EditableLabelGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.editable.EditableGidBuilderImpl!T
{

  mixin EditableGidBuilderT!();

  /**
      Set `editing` property.
      Params:
        propval = This property is true while the widget is in edit mode.
      Returns: Builder instance for fluent chaining
  */
  T editing(bool propval) nothrow
  {
    return setProperty("editing", propval);
  }
}

/// Fluent builder for [gid.gtk4.editable_label.EditableLabel]
final class EditableLabelGidBuilder : EditableLabelGidBuilderImpl!EditableLabelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EditableLabel build() nothrow
  {
    return new EditableLabel(cast(void*)createGObject(EditableLabel._getGType), Yes.Take);
  }
}
