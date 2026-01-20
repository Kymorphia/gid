/// Module for [ListModel] interface
module gio.list_model;

public import gio.list_model_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.dclosure;
import gobject.object;
import gobject.types;

/**
    [gio.list_model.ListModel] is an interface that represents a mutable list of
    [gobject.object.ObjectWrap]. Its main intention is as a model for various widgets
    in user interfaces, such as list views, but it can also be used as a
    convenient method of returning lists of data, with support for
    updates.
    
    Each object in the list may also report changes in itself via some
    mechanism (normally the [gobject.object.ObjectWrap.notify] signal).  Taken
    together with the `signal@Gio.ListModel::items-changed` signal, this provides
    for a list that can change its membership, and in which the members can
    change their individual properties.
    
    A good example would be the list of visible wireless network access
    points, where each access point can report dynamic properties such as
    signal strength.
    
    It is important to note that the [gio.list_model.ListModel] itself does not report
    changes to the individual items.  It only reports changes to the list
    membership.  If you want to observe changes to the objects themselves
    then you need to connect signals to the objects that you are
    interested in.
    
    All items in a [gio.list_model.ListModel] are of (or derived from) the same type.
    [gio.list_model.ListModel.getItemType] returns that type.  The type may be an
    interface, in which case all objects in the list must implement it.
    
    The semantics are close to that of an array:
    [gio.list_model.ListModel.getNItems] returns the number of items in the list
    and [gio.list_model.ListModel.getItem] returns an item at a (0-based) position.
    In order to allow implementations to calculate the list length lazily,
    you can also iterate over items: starting from 0, repeatedly call
    [gio.list_model.ListModel.getItem] until it returns `NULL`.
    
    An implementation may create objects lazily, but must take care to
    return the same object for a given position until all references to
    it are gone.
    
    On the other side, a consumer is expected only to hold references on
    objects that are currently ‘user visible’, in order to facilitate the
    maximum level of laziness in the implementation of the list and to
    reduce the required number of signal connections at a given time.
    
    This interface is intended only to be used from a single thread.  The
    thread in which it is appropriate to use it depends on the particular
    implementation, but typically it will be from the thread that owns
    the thread-default main context (see
    [glib.main_context.MainContext.pushThreadDefault]) in effect at the time that the
    model was created.
    
    Over time, it has established itself as good practice for list model
    implementations to provide properties `item-type` and `n-items` to
    ease working with them. While it is not required, it is recommended
    that implementations provide these two properties. They should return
    the values of [gio.list_model.ListModel.getItemType] and
    [gio.list_model.ListModel.getNItems] respectively and be defined as such:
    
    ```c
    properties[PROP_ITEM_TYPE] =
      g_param_spec_gtype ("item-type", NULL, NULL, G_TYPE_OBJECT,
                          G_PARAM_CONSTRUCT_ONLY | G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS);
    properties[PROP_N_ITEMS] =
      g_param_spec_uint ("n-items", NULL, NULL, 0, G_MAXUINT, 0,
                         G_PARAM_READABLE | G_PARAM_STATIC_STRINGS);
    ```
*/
interface ListModel
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_list_model_get_type != &gidSymbolNotFound ? g_list_model_get_type() : cast(GType)0;
  }

  /**
  * Get the item at position and cast to the template type.
  * NOTE: If type is an interface and no known D object is found that the object conforms to,
  * the interface IfaceProxy object will be used.
  * If position is greater than the number of items in list, %NULL is
  * returned.
  * %NULL may be returned if index is smaller than the length
  * of the list, but the object does not conform to the template type.
  * This function is meant to be used by language bindings in place
  * of [Gio.ListModel.getItem].
  * See also: [Gio.ListModel.getNItems]
  * Params:
  *   T = type to cast the resulting object to (can be an interface type)
  *   position = the position of the item to fetch
  * Returns: the object at position.
  */
  T getItem(T)(uint position)
  {
    auto gobj = cast(GObject*)g_list_model_get_object(cast(GListModel*)(cast(gobject.object.ObjectWrap)this)._cPtr, position);
    return gobject.object.ObjectWrap._getDObject!T(gobj, Yes.Take);
  }



  /**
      Gets the type of the items in list.
      
      All items returned from [gio.list_model.ListModel.getItem] are of the type
      returned by this function, or a subtype, or if the type is an
      interface, they are an implementation of that interface.
      
      The item type of a #GListModel can not change during the life of the
      model.
      Returns: the #GType of the items contained in list.
  */
  gobject.types.GType getItemType();

  /**
      Gets the number of items in list.
      
      Depending on the model implementation, calling this function may be
      less efficient than iterating the list with increasing values for
      position until [gio.list_model.ListModel.getItem] returns null.
      Returns: the number of items in list.
  */
  uint getNItems();

  /**
      Get the item at position.
      
      If position is greater than the number of items in list, null is
      returned.
      
      null is never returned for an index that is smaller than the length
      of the list.
      
      This function is meant to be used by language bindings in place
      of [gio.list_model.ListModel.getItem].
      
      See also: [gio.list_model.ListModel.getNItems]
  
      Params:
        position = the position of the item to fetch
      Returns: the object at position.
  */
  gobject.object.ObjectWrap getItem(uint position);

  /**
      Emits the #GListModel::items-changed signal on list.
      
      This function should only be called by classes implementing
      #GListModel. It has to be called after the internal representation
      of list has been updated, because handlers connected to this signal
      might query the new state of the list.
      
      Implementations must only make changes to the model (as visible to
      its consumer) in places that will not cause problems for that
      consumer.  For models that are driven directly by a write API (such
      as #GListStore), changes can be reported in response to uses of that
      API.  For models that represent remote data, changes should only be
      made from a fresh mainloop dispatch.  It is particularly not
      permitted to make changes in response to a call to the #GListModel
      consumer API.
      
      Stated another way: in general, it is assumed that code making a
      series of accesses to the model via the API, without returning to the
      mainloop, and without calling other code, will continue to view the
      same contents of the model.
  
      Params:
        position = the position at which list changed
        removed = the number of items removed
        added = the number of items added
  */
  void itemsChanged(uint position, uint removed, uint added);

  /**
      Connect to `ItemsChanged` signal.
  
      This signal is emitted whenever items were added to or removed
        from list. At position, removed items were removed and added
        items were added in their place.
        
        Note: If `removed != added`, the positions of all later items
        in the model change.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(uint position, uint removed, uint added, gio.list_model.ListModel listModel))
  
          `position` the position at which list changed (optional)
  
          `removed` the number of items removed (optional)
  
          `added` the number of items added (optional)
  
          `listModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectItemsChanged(T)(T callback, Flag!"After" after = No.After);
}
