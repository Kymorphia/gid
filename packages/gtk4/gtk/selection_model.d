/// Module for [SelectionModel] interface
module gtk.selection_model;

public import gtk.selection_model_iface_proxy;
import gid.gid;
import gobject.dclosure;
import gtk.bitset;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.selection_model.SelectionModel] is an interface that add support for selection to list models.
    
    This support is then used by widgets using list models to add the ability
    to select and unselect various items.
    
    GTK provides default implementations of the most common selection modes such
    as [gtk.single_selection.SingleSelection], so you will only need to implement this
    interface if you want detailed control about how selections should be handled.
    
    A [gtk.selection_model.SelectionModel] supports a single boolean per item indicating if an item is
    selected or not. This can be queried via [gtk.selection_model.SelectionModel.isSelected].
    When the selected state of one or more items changes, the model will emit the
    `signal@Gtk.SelectionModel::selection-changed` signal by calling the
    [gtk.selection_model.SelectionModel.selectionChanged] function. The positions given
    in that signal may have their selection state changed, though that is not a
    requirement. If new items added to the model via the
    `signal@Gio.ListModel::items-changed` signal are selected or not is up to the
    implementation.
    
    Note that items added via `signal@Gio.ListModel::items-changed` may already
    be selected and no `signal@Gtk.SelectionModel::selection-changed` will be
    emitted for them. So to track which items are selected, it is necessary to
    listen to both signals.
    
    Additionally, the interface can expose functionality to select and unselect
    items. If these functions are implemented, GTK's list widgets will allow users
    to select and unselect items. However, [gtk.selection_model.SelectionModel]s are free to only
    implement them partially or not at all. In that case the widgets will not
    support the unimplemented operations.
    
    When selecting or unselecting is supported by a model, the return values of
    the selection functions do *not* indicate if selection or unselection happened.
    They are only meant to indicate complete failure, like when this mode of
    selecting is not supported by the model.
    
    Selections may happen asynchronously, so the only reliable way to find out
    when an item was selected is to listen to the signals that indicate selection.
*/
interface SelectionModel
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_selection_model_get_type != &gidSymbolNotFound ? gtk_selection_model_get_type() : cast(GType)0;
  }

  /**
      Gets the set containing all currently selected items in the model.
      
      This function may be slow, so if you are only interested in single item,
      consider using [gtk.selection_model.SelectionModel.isSelected] or if you are only
      interested in a few, consider [gtk.selection_model.SelectionModel.getSelectionInRange].
      Returns: a [gtk.bitset.Bitset] containing all the values currently
          selected in model. If no items are selected, the bitset is empty.
          The bitset must not be modified.
  */
  gtk.bitset.Bitset getSelection();

  /**
      Gets the set of selected items in a range.
      
      This function is an optimization for
      [gtk.selection_model.SelectionModel.getSelection] when you are only
      interested in part of the model's selected state. A common use
      case is in response to the `signalGtk.SelectionModel::selection-changed`
      signal.
  
      Params:
        position = start of the queried range
        nItems = number of items in the queried range
      Returns: A [gtk.bitset.Bitset] that matches the selection state
          for the given range with all other values being undefined.
          The bitset must not be modified.
  */
  gtk.bitset.Bitset getSelectionInRange(uint position, uint nItems);

  /**
      Checks if the given item is selected.
  
      Params:
        position = the position of the item to query
      Returns: true if the item is selected
  */
  bool isSelected(uint position);

  /**
      Requests to select all items in the model.
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean that all items are now selected.
  */
  bool selectAll();

  /**
      Requests to select an item in the model.
  
      Params:
        position = the position of the item to select
        unselectRest = whether previously selected items should be unselected
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean the item was selected.
  */
  bool selectItem(uint position, bool unselectRest);

  /**
      Requests to select a range of items in the model.
  
      Params:
        position = the first item to select
        nItems = the number of items to select
        unselectRest = whether previously selected items should be unselected
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean the range was selected.
  */
  bool selectRange(uint position, uint nItems, bool unselectRest);

  /**
      Helper function for implementations of [gtk.selection_model.SelectionModel].
      
      Call this when the selection changes to emit the
      `signalGtk.SelectionModel::selection-changed` signal.
  
      Params:
        position = the first changed item
        nItems = the number of changed items
  */
  void selectionChanged(uint position, uint nItems);

  /**
      Make selection changes.
      
      This is the most advanced selection updating method that allows
      the most fine-grained control over selection changes. If you can,
      you should try the simpler versions, as implementations are more
      likely to implement support for those.
      
      Requests that the selection state of all positions set in mask
      be updated to the respective value in the selected bitmask.
      
      In pseudocode, it would look something like this:
      
      ```c
      for (i = 0; i < n_items; i++)
        {
          // don't change values not in the mask
          if (!gtk_bitset_contains (mask, i))
            continue;
      
          if (gtk_bitset_contains (selected, i))
            select_item (i);
          else
            unselect_item (i);
        }
      
      gtk_selection_model_selection_changed (model,
                                             first_changed_item,
                                             n_changed_items);
      ```
      
      mask and selected must not be modified. They may refer to the
      same bitset, which would mean that every item in the set should
      be selected.
  
      Params:
        selected = bitmask specifying if items should be selected or unselected
        mask = bitmask specifying which items should be updated
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean that all items were updated according
          to the inputs.
  */
  bool setSelection(gtk.bitset.Bitset selected, gtk.bitset.Bitset mask);

  /**
      Requests to unselect all items in the model.
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean that all items are now unselected.
  */
  bool unselectAll();

  /**
      Requests to unselect an item in the model.
  
      Params:
        position = the position of the item to unselect
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean the item was unselected.
  */
  bool unselectItem(uint position);

  /**
      Requests to unselect a range of items in the model.
  
      Params:
        position = the first item to unselect
        nItems = the number of items to unselect
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean the range was unselected.
  */
  bool unselectRange(uint position, uint nItems);

  /**
      Connect to `SelectionChanged` signal.
  
      Emitted when the selection state of some of the items in model changes.
        
        Note that this signal does not specify the new selection state of the
        items, they need to be queried manually. It is also not necessary for
        a model to change the selection state of any of the items in the selection
        model, though it would be rather useless to emit such a signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(uint position, uint nItems, gtk.selection_model.SelectionModel selectionModel))
  
          `position` The first item that may have changed (optional)
  
          `nItems` number of items with changes (optional)
  
          `selectionModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectionChanged(T)(T callback, Flag!"After" after = No.After);
}
