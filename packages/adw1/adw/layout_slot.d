/// Module for [LayoutSlot] class
module adw.layout_slot;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A child slot within [adw.layout.Layout].
    
    While it contains a layout child, the [gtk.widget.Widget.visible] property
    of the slot is updated to match that of the layout child.
    
    See [adw.multi_layout_view.MultiLayoutView].
*/
class LayoutSlot : gtk.widget.Widget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_layout_slot_get_type != &gidSymbolNotFound ? adw_layout_slot_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LayoutSlot self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.layout_slot.LayoutSlot]
      Returns: New builder object
  */
  static LayoutSlotGidBuilder builder() nothrow
  {
    return new LayoutSlotGidBuilder;
  }

  /**
      Get `id` property.
      Returns: The slot ID.
        
        See [adw.multi_layout_view.MultiLayoutView.setChild].
  */
  @property string id() nothrow
  {
    return getSlotId();
  }

  /**
      Creates a new [adw.layout_slot.LayoutSlot] with its ID set to id.
  
      Params:
        id = the slot ID
      Returns: a new [adw.layout_slot.LayoutSlot]
  */
  this(string id) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    _cretval = adw_layout_slot_new(_id);
    this(_cretval, No.Take);
  }

  /**
      Gets the slot id of self.
      Returns: the slot ID
  */
  string getSlotId() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_layout_slot_get_slot_id(cast(AdwLayoutSlot*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [adw.layout_slot.LayoutSlot]
class LayoutSlotGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `id` property.
      Params:
        propval = The slot ID.
          
          See [adw.multi_layout_view.MultiLayoutView.setChild].
      Returns: Builder instance for fluent chaining
  */
  T id(string propval) nothrow
  {
    return setProperty("id", propval);
  }
}

/// Fluent builder for [adw.layout_slot.LayoutSlot]
final class LayoutSlotGidBuilder : LayoutSlotGidBuilderImpl!LayoutSlotGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LayoutSlot build() nothrow
  {
    return new LayoutSlot(cast(void*)createGObject(LayoutSlot._getGType), Yes.Take);
  }
}
