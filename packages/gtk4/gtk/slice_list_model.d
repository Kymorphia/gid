/// Module for [SliceListModel] class
module gtk.slice_list_model;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.gid_builder;
import gobject.object;
import gobject.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.section_model;
import gtk.section_model_mixin;
import gtk.types;

/**
    [gtk.slice_list_model.SliceListModel] is a list model that presents a slice of another model.
    
    This is useful when implementing paging by setting the size to the number
    of elements per page and updating the offset whenever a different page is
    opened.
    
    [gtk.slice_list_model.SliceListModel] passes through sections from the underlying model.
*/
class SliceListModel : gobject.object.ObjectWrap, gio.list_model.ListModel, gtk.section_model.SectionModel
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
    return cast(void function())gtk_slice_list_model_get_type != &gidSymbolNotFound ? gtk_slice_list_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SliceListModel self()
  {
    return this;
  }

  /**
      Get builder for [gtk.slice_list_model.SliceListModel]
      Returns: New builder object
  */
  static SliceListModelGidBuilder builder()
  {
    return new SliceListModelGidBuilder;
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
      Get `model` property.
      Returns: Child model to take slice from.
  */
  @property gio.list_model.ListModel model()
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = Child model to take slice from.
  */
  @property void model(gio.list_model.ListModel propval)
  {
    setModel(propval);
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gio.list_model.ListModel.getNItems].
  */
  @property uint nItems()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  /**
      Get `offset` property.
      Returns: Offset of slice.
  */
  @property uint offset()
  {
    return getOffset();
  }

  /**
      Set `offset` property.
      Params:
        propval = Offset of slice.
  */
  @property void offset(uint propval)
  {
    setOffset(propval);
  }

  /**
      Get `size` property.
      Returns: Maximum size of slice.
  */
  @property uint size()
  {
    return getSize();
  }

  /**
      Set `size` property.
      Params:
        propval = Maximum size of slice.
  */
  @property void size(uint propval)
  {
    setSize(propval);
  }

  mixin ListModelT!();
  mixin SectionModelT!();

  /**
      Creates a new slice model.
      
      It presents the slice from offset to offset + size
      of the given model.
  
      Params:
        model = The model to use
        offset = the offset of the slice
        size = maximum size of the slice
      Returns: A new [gtk.slice_list_model.SliceListModel]
  */
  this(gio.list_model.ListModel model, uint offset, uint size)
  {
    GtkSliceListModel* _cretval;
    _cretval = gtk_slice_list_model_new(model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(Yes.Dup) : null, offset, size);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the model that is currently being used or null if none.
      Returns: The model in use
  */
  gio.list_model.ListModel getModel()
  {
    GListModel* _cretval;
    _cretval = gtk_slice_list_model_get_model(cast(GtkSliceListModel*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the offset set via [gtk.slice_list_model.SliceListModel.setOffset].
      Returns: The offset
  */
  uint getOffset()
  {
    uint _retval;
    _retval = gtk_slice_list_model_get_offset(cast(GtkSliceListModel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the size set via [gtk.slice_list_model.SliceListModel.setSize].
      Returns: The size
  */
  uint getSize()
  {
    uint _retval;
    _retval = gtk_slice_list_model_get_size(cast(GtkSliceListModel*)this._cPtr);
    return _retval;
  }

  /**
      Sets the model to show a slice of.
      
      The model's item type must conform to self's item type.
  
      Params:
        model = The model to be sliced
  */
  void setModel(gio.list_model.ListModel model = null)
  {
    gtk_slice_list_model_set_model(cast(GtkSliceListModel*)this._cPtr, model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Sets the offset into the original model for this slice.
      
      If the offset is too large for the sliced model,
      self will end up empty.
  
      Params:
        offset = the new offset to use
  */
  void setOffset(uint offset)
  {
    gtk_slice_list_model_set_offset(cast(GtkSliceListModel*)this._cPtr, offset);
  }

  /**
      Sets the maximum size. self will never have more items
      than size.
      
      It can however have fewer items if the offset is too large
      or the model sliced from doesn't have enough items.
  
      Params:
        size = the maximum size
  */
  void setSize(uint size)
  {
    gtk_slice_list_model_set_size(cast(GtkSliceListModel*)this._cPtr, size);
  }
}

/// Fluent builder implementation template for [gtk.slice_list_model.SliceListModel]
class SliceListModelGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.list_model.ListModelGidBuilderImpl!T, gtk.section_model.SectionModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
  mixin SectionModelGidBuilderT!();

  /**
      Set `model` property.
      Params:
        propval = Child model to take slice from.
      Returns: Builder instance for fluent chaining
  */
  T model(gio.list_model.ListModel propval)
  {
    return setProperty("model", propval);
  }

  /**
      Set `offset` property.
      Params:
        propval = Offset of slice.
      Returns: Builder instance for fluent chaining
  */
  T offset(uint propval)
  {
    return setProperty("offset", propval);
  }

  /**
      Set `size` property.
      Params:
        propval = Maximum size of slice.
      Returns: Builder instance for fluent chaining
  */
  T size(uint propval)
  {
    return setProperty("size", propval);
  }
}

/// Fluent builder for [gtk.slice_list_model.SliceListModel]
final class SliceListModelGidBuilder : SliceListModelGidBuilderImpl!SliceListModelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SliceListModel build()
  {
    return new SliceListModel(cast(void*)createGObject(SliceListModel._getGType), Yes.Take);
  }
}
