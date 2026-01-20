/// Module for [Selection] interface
module atk.selection;

public import atk.selection_iface_proxy;
import atk.c.functions;
import atk.c.types;
import atk.object;
import atk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;

/**
    The ATK interface implemented by container objects whose #AtkObject children can be selected.
    
    #AtkSelection should be implemented by UI components with children
    which are exposed by #atk_object_ref_child and
    #atk_object_get_n_children, if the use of the parent UI component
    ordinarily involves selection of one or more of the objects
    corresponding to those #AtkObject children - for example,
    selectable lists.
    
    Note that other types of "selection" (for instance text selection)
    are accomplished a other ATK interfaces - #AtkSelection is limited
    to the selection/deselection of children.
*/
interface Selection
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_selection_get_type != &gidSymbolNotFound ? atk_selection_get_type() : cast(GType)0;
  }

  /**
      Adds the specified accessible child of the object to the
      object's selection.
  
      Params:
        i = a #gint specifying the child index.
      Returns: TRUE if success, FALSE otherwise.
  */
  bool addSelection(int i);

  /**
      Clears the selection in the object so that no children in the object
      are selected.
      Returns: TRUE if success, FALSE otherwise.
  */
  bool clearSelection();

  /**
      Gets the number of accessible children currently selected.
      Note: callers should not rely on null or on a zero value for
      indication of whether AtkSelectionIface is implemented, they should
      use type checking/interface checking macros or the
      atk_get_accessible_value() convenience method.
      Returns: a gint representing the number of items selected, or 0
        if selection does not implement this interface.
  */
  int getSelectionCount();

  /**
      Determines if the current child of this object is selected
      Note: callers should not rely on null or on a zero value for
      indication of whether AtkSelectionIface is implemented, they should
      use type checking/interface checking macros or the
      atk_get_accessible_value() convenience method.
  
      Params:
        i = a #gint specifying the child index.
      Returns: a gboolean representing the specified child is selected, or 0
        if selection does not implement this interface.
  */
  bool isChildSelected(int i);

  /**
      Gets a reference to the accessible object representing the specified
      selected child of the object.
      Note: callers should not rely on null or on a zero value for
      indication of whether AtkSelectionIface is implemented, they should
      use type checking/interface checking macros or the
      atk_get_accessible_value() convenience method.
  
      Params:
        i = a #gint specifying the index in the selection set.  (e.g. the
          ith selection as opposed to the ith child).
      Returns: an #AtkObject representing the
        selected accessible, or null if selection does not implement this
        interface.
  */
  atk.object.ObjectWrap refSelection(int i);

  /**
      Removes the specified child of the object from the object's selection.
  
      Params:
        i = a #gint specifying the index in the selection set.  (e.g. the
          ith selection as opposed to the ith child).
      Returns: TRUE if success, FALSE otherwise.
  */
  bool removeSelection(int i);

  /**
      Causes every child of the object to be selected if the object
      supports multiple selections.
      Returns: TRUE if success, FALSE otherwise.
  */
  bool selectAllSelection();

  /**
      Connect to `SelectionChanged` signal.
  
      The "selection-changed" signal is emitted by an object which
        implements AtkSelection interface when the selection changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(atk.selection.Selection selection))
  
          `selection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectionChanged(T)(T callback, Flag!"After" after = No.After);
}
