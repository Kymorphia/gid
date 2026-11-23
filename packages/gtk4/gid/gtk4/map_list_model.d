/// Module for [MapListModel] class
module gid.gtk4.map_list_model;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.section_model;
import gid.gtk4.section_model_mixin;
import gid.gtk4.types;

/**
    A list model that maps the items in another model to different items.
    
    [gid.gtk4.map_list_model.MapListModel] uses a [gid.gtk4.types.MapListModelMapFunc].
    
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
    
    [gid.gtk4.map_list_model.MapListModel] will attempt to discard the mapped objects as soon as
    they are no longer needed and recreate them if necessary.
    
    [gid.gtk4.map_list_model.MapListModel] passes through sections from the underlying model.
*/
class MapListModel : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel, gid.gtk4.section_model.SectionModel
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
    return cast(void function())gtk_map_list_model_get_type != &gidSymbolNotFound ? gtk_map_list_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMapListModel";
  }

  /** Returns `this`, for use in `with` statements. */
  override MapListModel self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.map_list_model.MapListModel]
      Returns: New builder object
  */
  static MapListModelGidBuilder builder() nothrow
  {
    return new MapListModelGidBuilder;
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
      Get `model` property.
      Returns: The model being mapped.
  */
  @property gid.gio2.list_model.ListModel model() nothrow
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model being mapped.
  */
  @property void model(gid.gio2.list_model.ListModel propval) nothrow
  {
    setModel(propval);
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gid.gio2.list_model.ListModel.getNItems].
  */
  @property uint nItems() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  mixin ListModelT!();
  mixin SectionModelT!();

  /**
      Creates a new [gid.gtk4.map_list_model.MapListModel] for the given arguments.
  
      Params:
        model = The model to map
        mapFunc = map function
      Returns: a new [gid.gtk4.map_list_model.MapListModel]
  */
  this(gid.gio2.list_model.ListModel model = null, gid.gtk4.types.MapListModelMapFunc mapFunc = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, model !is null || mapFunc !is null), Yes.Take);
    }
    else
    {
      extern(C) GObject* _mapFuncCallback(GObject* item, void* userData) nothrow
      {
        gidAttachThread();
        gid.gobject2.object.ObjectWrap _dretval;
        auto _dlg = cast(gid.gtk4.types.MapListModelMapFunc*)userData;

        try
        {
          _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)item, Yes.Take));
        }
        catch (Exception e)
        {
          gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.MapListModelMapFunc");
        }
        auto _retval = _dretval ? cast(GObject*)_dretval._cPtr(Yes.Dup) : null;

        return _retval;
      }
      auto _mapFuncCB = mapFunc ? &_mapFuncCallback : null;
      GtkMapListModel* _cretval;
      auto _mapFunc = mapFunc ? freezeDelegate(cast(void*)&mapFunc) : null;
      GDestroyNotify _mapFuncDestroyCB = mapFunc ? &thawDelegate : null;
      _cretval = gtk_map_list_model_new(model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(Yes.Dup) : null, _mapFuncCB, _mapFunc, _mapFuncDestroyCB);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets the model that is currently being mapped or null if none.
      Returns: The model that gets mapped
  */
  gid.gio2.list_model.ListModel getModel() nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_map_list_model_get_model(cast(GtkMapListModel*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if a map function is currently set on self.
      Returns: true if a map function is set
  */
  bool hasMap() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_map_list_model_has_map(cast(GtkMapListModel*)this._cPtr);
    return _retval;
  }

  /**
      Sets the function used to map items.
      
      The function will be called whenever an item needs to be mapped
      and must return the item to use for the given input item.
      
      Note that [gid.gtk4.map_list_model.MapListModel] may call this function multiple times
      on the same item, because it may delete items it doesn't need anymore.
      
      GTK makes no effort to ensure that map_func conforms to the item type
      of self. It assumes that the caller knows what they are doing and the map
      function returns items of the appropriate type.
  
      Params:
        mapFunc = map function
  */
  void setMapFunc(gid.gtk4.types.MapListModelMapFunc mapFunc = null) nothrow
  {
    extern(C) GObject* _mapFuncCallback(GObject* item, void* userData) nothrow
    {
      gidAttachThread();
      gid.gobject2.object.ObjectWrap _dretval;
      auto _dlg = cast(gid.gtk4.types.MapListModelMapFunc*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)item, Yes.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.MapListModelMapFunc");
      }
      auto _retval = _dretval ? cast(GObject*)_dretval._cPtr(Yes.Dup) : null;

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
  void setModel(gid.gio2.list_model.ListModel model = null) nothrow
  {
    gtk_map_list_model_set_model(cast(GtkMapListModel*)this._cPtr, model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.map_list_model.MapListModel]
class MapListModelGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T, gid.gtk4.section_model.SectionModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
  mixin SectionModelGidBuilderT!();

  /**
      Set `model` property.
      Params:
        propval = The model being mapped.
      Returns: Builder instance for fluent chaining
  */
  T model(gid.gio2.list_model.ListModel propval) nothrow
  {
    return setProperty("model", propval);
  }
}

/// Fluent builder for [gid.gtk4.map_list_model.MapListModel]
final class MapListModelGidBuilder : MapListModelGidBuilderImpl!MapListModelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MapListModel build() nothrow
  {
    return new MapListModel(cast(void*)createGObject(MapListModel._getGType), Yes.Take);
  }
}
