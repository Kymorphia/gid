/// Module for [CellRendererCombo] class
module gtk.cell_renderer_combo;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_renderer_text;
import gtk.tree_iter;
import gtk.tree_model;
import gtk.types;

/**
    #GtkCellRendererCombo renders text in a cell like #GtkCellRendererText from
    which it is derived. But while #GtkCellRendererText offers a simple entry to
    edit the text, #GtkCellRendererCombo offers a #GtkComboBox
    widget to edit the text. The values to display in the combo box are taken from
    the tree model specified in the #GtkCellRendererCombo:model property.
    
    The combo cell renderer takes care of adding a text cell renderer to the combo
    box and sets it to display the column specified by its
    #GtkCellRendererCombo:text-column property. Further properties of the combo box
    can be set in a handler for the #GtkCellRenderer::editing-started signal.
    
    The #GtkCellRendererCombo cell renderer was added in GTK+ 2.6.
*/
class CellRendererCombo : gtk.cell_renderer_text.CellRendererText
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
    return cast(void function())gtk_cell_renderer_combo_get_type != &gidSymbolNotFound ? gtk_cell_renderer_combo_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CellRendererCombo self()
  {
    return this;
  }

  /**
      Get `hasEntry` property.
      Returns: If true, the cell renderer will include an entry and allow to enter
        values other than the ones in the popup list.
  */
  @property bool hasEntry()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("has-entry");
  }

  /**
      Set `hasEntry` property.
      Params:
        propval = If true, the cell renderer will include an entry and allow to enter
          values other than the ones in the popup list.
  */
  @property void hasEntry(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("has-entry", propval);
  }

  /**
      Get `model` property.
      Returns: Holds a tree model containing the possible values for the combo box.
        Use the text_column property to specify the column holding the values.
  */
  @property gtk.tree_model.TreeModel model()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.tree_model.TreeModel)("model");
  }

  /**
      Set `model` property.
      Params:
        propval = Holds a tree model containing the possible values for the combo box.
          Use the text_column property to specify the column holding the values.
  */
  @property void model(gtk.tree_model.TreeModel propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.tree_model.TreeModel)("model", propval);
  }

  /**
      Get `textColumn` property.
      Returns: Specifies the model column which holds the possible values for the
        combo box.
        
        Note that this refers to the model specified in the model property,
        not the model backing the tree view to which
        this cell renderer is attached.
        
        #GtkCellRendererCombo automatically adds a text cell renderer for
        this column to its combo box.
  */
  @property int textColumn()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("text-column");
  }

  /**
      Set `textColumn` property.
      Params:
        propval = Specifies the model column which holds the possible values for the
          combo box.
          
          Note that this refers to the model specified in the model property,
          not the model backing the tree view to which
          this cell renderer is attached.
          
          #GtkCellRendererCombo automatically adds a text cell renderer for
          this column to its combo box.
  */
  @property void textColumn(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("text-column", propval);
  }

  /**
      Creates a new #GtkCellRendererCombo.
      Adjust how text is drawn using object properties.
      Object properties can be set globally (with [gobject.object.ObjectWrap.set]).
      Also, with #GtkTreeViewColumn, you can bind a property to a value
      in a #GtkTreeModel. For example, you can bind the “text” property
      on the cell renderer to a string value in the model, thus rendering
      a different string in each row of the #GtkTreeView.
      Returns: the new cell renderer
  */
  this()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_combo_new();
    this(_cretval, No.Take);
  }

  /**
      Connect to `Changed` signal.
  
      This signal is emitted each time after the user selected an item in
        the combo box, either by using the mouse or the arrow keys.  Contrary
        to GtkComboBox, GtkCellRendererCombo::changed is not emitted for
        changes made to a selected item in the entry.  The argument new_iter
        corresponds to the newly selected item in the combo box and it is relative
        to the GtkTreeModel set via the model property on GtkCellRendererCombo.
        
        Note that as soon as you change the model displayed in the tree view,
        the tree view will immediately cease the editing operating.  This
        means that you most probably want to refrain from changing the model
        until the combo cell renderer emits the edited or editing_canceled signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string pathString, gtk.tree_iter.TreeIter newIter, gtk.cell_renderer_combo.CellRendererCombo cellRendererCombo))
  
          `pathString` a string of the path identifying the edited cell
                          (relative to the tree view model) (optional)
  
          `newIter` the new iter selected in the combo box
                       (relative to the combo box model) (optional)
  
          `cellRendererCombo` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.tree_iter.TreeIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.cell_renderer_combo.CellRendererCombo)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}
