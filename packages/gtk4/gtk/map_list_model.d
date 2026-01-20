/// Module for [MapListModel] class
module gtk.map_list_model;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.object;
import gobject.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.section_model;
import gtk.section_model_mixin;
import gtk.types;

/**
    A [gtk.map_list_model.MapListModel] maps the items in a list model to different items.
    
    [gtk.map_list_model.MapListModel] uses a [gtk.types.MapListModelMapFunc].
    
    Example: Create a list of `GtkEventControllers`
    ```c
    static gpointer
    map_to_controllers (gpointer widget,
                        gpointer data)
    {
      gpointer result = gtk_widget_observe_controllers (widget);
      g_object_unref (widget);
      return result;
    }
    
    widgets = gtk_widget_observe_children (widget);
    
    controllers = gtk_map_list_model_new (widgets,
                                          map_to_controllers,
                                          NULL, NULL);
    
    model = gtk_flatten_list_model_new (GTK_TYPE_EVENT_CONTROLLER,
                                        controllers);
    ```
    
    [gtk.map_list_model.MapListModel] will attempt to discard the mapped objects as soon as
    they are no longer needed and recreate them if necessary.
    
    [gtk.map_list_model.MapListModel] passes through sections from the underlying model.
*/
class MapListModel : gobject.object.ObjectWrap, gio.list_model.ListModel, gtk.section_model.SectionModel
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
    return cast(void function())gtk_map_list_model_get_type != &gidSymbolNotFound ? gtk_map_list_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MapListModel self()
  {
    return this;
  }

  /**
      Get `itemType` property.
      Returns: The type of items. See [gio.list_model.ListModel.getItemType].
  */
  @property gobject.types.GType itemType()
  {
    return gobject.object.ObjectWrap.getProperty!(gobject.types.GType)("item-type");
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gio.list_model.ListModel.getNItems].
  */
  @property uint nItems()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  mixin ListModelT!();
  mixin SectionModelT!();

  /**
      Creates a new [gtk.map_list_model.MapListModel] for the given arguments.
  
      Params:
        model = The model to map
        mapFunc = map function
      Returns: a new [gtk.map_list_model.MapListModel]
  */
  this(gio.list_model.ListModel model = null, gtk.types.MapListModelMapFunc mapFunc = null)
  {
    extern(C) GObject* _mapFuncCallback(GObject* item, void* userData)
    {
      gobject.object.ObjectWrap _dretval;
      auto _dlg = cast(gtk.types.MapListModelMapFunc*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)item, Yes.Take));
      auto _retval = cast(GObject*)_dretval._cPtr(Yes.Dup);

      return _retval;
    }
    auto _mapFuncCB = mapFunc ? &_mapFuncCallback : null;
    GtkMapListModel* _cretval;
    auto _mapFunc = mapFunc ? freezeDelegate(cast(void*)&mapFunc) : null;
    GDestroyNotify _mapFuncDestroyCB = mapFunc ? &thawDelegate : null;
    _cretval = gtk_map_list_model_new(model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(Yes.Dup) : null, _mapFuncCB, _mapFunc, _mapFuncDestroyCB);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the model that is currently being mapped or null if none.
      Returns: The model that gets mapped
  */
  gio.list_model.ListModel getModel()
  {
    GListModel* _cretval;
    _cretval = gtk_map_list_model_get_model(cast(GtkMapListModel*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if a map function is currently set on self.
      Returns: true if a map function is set
  */
  bool hasMap()
  {
    bool _retval;
    _retval = cast(bool)gtk_map_list_model_has_map(cast(GtkMapListModel*)this._cPtr);
    return _retval;
  }

  /**
      Sets the function used to map items.
      
      The function will be called whenever an item needs to be mapped
      and must return the item to use for the given input item.
      
      Note that [gtk.map_list_model.MapListModel] may call this function multiple times
      on the same item, because it may delete items it doesn't need anymore.
      
      GTK makes no effort to ensure that map_func conforms to the item type
      of self. It assumes that the caller knows what they are doing and the map
      function returns items of the appropriate type.
  
      Params:
        mapFunc = map function
  */
  void setMapFunc(gtk.types.MapListModelMapFunc mapFunc = null)
  {
    extern(C) GObject* _mapFuncCallback(GObject* item, void* userData)
    {
      gobject.object.ObjectWrap _dretval;
      auto _dlg = cast(gtk.types.MapListModelMapFunc*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)item, Yes.Take));
      auto _retval = cast(GObject*)_dretval._cPtr(Yes.Dup);

      return _retval;
    }
    auto _mapFuncCB = mapFunc ? &_mapFuncCallback : null;
    auto _mapFunc = mapFunc ? freezeDelegate(cast(void*)&mapFunc) : null;
    GDestroyNotify _mapFuncDestroyCB = mapFunc ? &thawDelegate : null;
    gtk_map_list_model_set_map_func(cast(GtkMapListModel*)this._cPtr, _mapFuncCB, _mapFunc, _mapFuncDestroyCB);
  }

  /**
      Sets the model to be mapped.
      
      GTK makes no effort to ensure that model conforms to the item type
      expected by the map function. It assumes that the caller knows what
      they are doing and have set up an appropriate map function.
  
      Params:
        model = The model to be mapped
  */
  void setModel(gio.list_model.ListModel model = null)
  {
    gtk_map_list_model_set_model(cast(GtkMapListModel*)this._cPtr, model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }
}
