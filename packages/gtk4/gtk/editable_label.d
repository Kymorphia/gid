/// Module for [EditableLabel] class
module gtk.editable_label;

import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.editable;
import gtk.editable_mixin;
import gtk.types;
import gtk.widget;

/**
    A [gtk.editable_label.EditableLabel] is a label that allows users to
    edit the text by switching to an “edit mode”.
    
    ![An example GtkEditableLabel](editable-label.png)
    
    [gtk.editable_label.EditableLabel] does not have API of its own, but it
    implements the [gtk.editable.Editable] interface.
    
    The default bindings for activating the edit mode is
    to click or press the Enter key. The default bindings
    for leaving the edit mode are the Enter key (to save
    the results) or the Escape key (to cancel the editing).
    
    # CSS nodes
    
    ```
    editablelabel[.editing]
    ╰── stack
        ├── label
        ╰── text
    ```
    
    [gtk.editable_label.EditableLabel] has a main node with the name editablelabel.
    When the entry is in editing mode, it gets the .editing style
    class.
    
    For all the subnodes added to the text node in various situations,
    see [gtk.text.Text].
*/
class EditableLabel : gtk.widget.Widget, gtk.editable.Editable
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
    return cast(void function())gtk_editable_label_get_type != &gidSymbolNotFound ? gtk_editable_label_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EditableLabel self()
  {
    return this;
  }

  /**
      Get `editing` property.
      Returns: This property is true while the widget is in edit mode.
  */
  @property bool editing()
  {
    return getEditing();
  }

  /**
      Set `editing` property.
      Params:
        propval = This property is true while the widget is in edit mode.
  */
  @property void editing(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("editing", propval);
  }

  mixin EditableT!();

  /**
      Creates a new [gtk.editable_label.EditableLabel] widget.
  
      Params:
        str = the text for the label
      Returns: the new [gtk.editable_label.EditableLabel]
  */
  this(string str)
  {
    GtkWidget* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = gtk_editable_label_new(_str);
    this(_cretval, No.Take);
  }

  /**
      Returns whether the label is currently in “editing mode”.
      Returns: true if self is currently in editing mode
  */
  bool getEditing()
  {
    bool _retval;
    _retval = cast(bool)gtk_editable_label_get_editing(cast(GtkEditableLabel*)this._cPtr);
    return _retval;
  }

  /**
      Switches the label into “editing mode”.
  */
  void startEditing()
  {
    gtk_editable_label_start_editing(cast(GtkEditableLabel*)this._cPtr);
  }

  /**
      Switches the label out of “editing mode”.
      
      If commit is true, the resulting text is kept as the
      [gtk.editable.Editable.text] property value, otherwise the
      resulting text is discarded and the label will keep its
      previous [gtk.editable.Editable.text] property value.
  
      Params:
        commit = whether to set the edited text on the label
  */
  void stopEditing(bool commit)
  {
    gtk_editable_label_stop_editing(cast(GtkEditableLabel*)this._cPtr, commit);
  }
}
