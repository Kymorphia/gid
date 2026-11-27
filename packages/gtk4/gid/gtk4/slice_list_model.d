/// Module for [SliceListModel] class
module gid.gtk4.slice_list_model;

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
    A list model that presents a slice of another model.
    
    This is useful when implementing paging by setting the size to the number
    of elements per page and updating the offset whenever a different page is
    opened.
    
    [gid.gtk4.slice_list_model.SliceListModel] passes through sections from the underlying model.
*/
@gidGir("SliceListModel", "SliceListModelClass")
class SliceListModel : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel, gid.gtk4.section_model.SectionModel
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
    return cast(void function())gtk_slice_list_model_get_type != &gidSymbolNotFound ? gtk_slice_list_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSliceListModel";
  }

  /** Returns `this`, for use in `with` statements. */
  override SliceListModel self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.slice_list_model.SliceListModel]
      Returns: New builder object
  */
  static SliceListModelGidBuilder builder() nothrow
  {
    return new SliceListModelGidBuilder;
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
      Returns: Child model to take slice from.
  */
  @property gid.gio2.list_model.ListModel model() nothrow
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = Child model to take slice from.
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

  /**
      Get `offset` property.
      Returns: Offset of slice.
  */
  @property uint offset() nothrow
  {
    return getOffset();
  }

  /**
      Set `offset` property.
      Params:
        propval = Offset of slice.
  */
  @property void offset(uint propval) nothrow
  {
    setOffset(propval);
  }

  /**
      Get `size` property.
      Returns: Maximum size of slice.
  */
  @property uint size() nothrow
  {
    return getSize();
  }

  /**
      Set `size` property.
      Params:
        propval = Maximum size of slice.
  */
  @property void size(uint propval) nothrow
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
      Returns: A new [gid.gtk4.slice_list_model.SliceListModel]
  */
  this(gid.gio2.list_model.ListModel model, uint offset, uint size) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkSliceListModel* _cretval;
      _cretval = gtk_slice_list_model_new(model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(Yes.Dup) : null, offset, size);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets the model that is currently being used or null if none.
      Returns: The model in use
  */
  gid.gio2.list_model.ListModel getModel() nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_slice_list_model_get_model(cast(GtkSliceListModel*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the offset set via [gid.gtk4.slice_list_model.SliceListModel.setOffset].
      Returns: The offset
  */
  uint getOffset() nothrow
  {
    uint _retval;
    _retval = gtk_slice_list_model_get_offset(cast(GtkSliceListModel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the size set via [gid.gtk4.slice_list_model.SliceListModel.setSize].
      Returns: The size
  */
  uint getSize() nothrow
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
  void setModel(gid.gio2.list_model.ListModel model = null) nothrow
  {
    gtk_slice_list_model_set_model(cast(GtkSliceListModel*)this._cPtr, model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Sets the offset into the original model for this slice.
      
      If the offset is too large for the sliced model,
      self will end up empty.
  
      Params:
        offset = the new offset to use
  */
  void setOffset(uint offset) nothrow
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
  void setSize(uint size) nothrow
  {
    gtk_slice_list_model_set_size(cast(GtkSliceListModel*)this._cPtr, size);
  }
}

/// Fluent builder implementation template for [gid.gtk4.slice_list_model.SliceListModel]
class SliceListModelGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T, gid.gtk4.section_model.SectionModelGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
  mixin SectionModelGidBuilderT!();

  /**
      Set `model` property.
      Params:
        propval = Child model to take slice from.
      Returns: Builder instance for fluent chaining
  */
  T model(gid.gio2.list_model.ListModel propval) nothrow
  {
    return setProperty("model", propval);
  }

  /**
      Set `offset` property.
      Params:
        propval = Offset of slice.
      Returns: Builder instance for fluent chaining
  */
  T offset(uint propval) nothrow
  {
    return setProperty("offset", propval);
  }

  /**
      Set `size` property.
      Params:
        propval = Maximum size of slice.
      Returns: Builder instance for fluent chaining
  */
  T size(uint propval) nothrow
  {
    return setProperty("size", propval);
  }
}

/// Fluent builder for [gid.gtk4.slice_list_model.SliceListModel]
final class SliceListModelGidBuilder : SliceListModelGidBuilderImpl!SliceListModelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SliceListModel build() nothrow
  {
    return new SliceListModel(cast(void*)createGObject(SliceListModel._getGType), Yes.Take);
  }
}
