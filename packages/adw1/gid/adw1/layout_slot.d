/// Module for [LayoutSlot] class
module gid.adw1.layout_slot;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.widget;

/**
    A child slot within [gid.adw1.layout.Layout].
    
    While it contains a layout child, the [gid.gtk4.widget.Widget.visible] property
    of the slot is updated to match that of the layout child.
    
    See [gid.adw1.multi_layout_view.MultiLayoutView].
*/
@gidGir("LayoutSlot", "LayoutSlotClass")
class LayoutSlot : gid.gtk4.widget.Widget
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
    return cast(void function())adw_layout_slot_get_type != &gidSymbolNotFound ? adw_layout_slot_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwLayoutSlot";
  }

  /** Returns `this`, for use in `with` statements. */
  override LayoutSlot self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.layout_slot.LayoutSlot]
      Returns: New builder object
  */
  static LayoutSlotGidBuilder builder() nothrow
  {
    return new LayoutSlotGidBuilder;
  }

  /**
      Get `id` property.
      Returns: The slot ID.
        
        See [gid.adw1.multi_layout_view.MultiLayoutView.setChild].
  */
  @property string id() nothrow
  {
    return getSlotId();
  }

  /**
      Creates a new [gid.adw1.layout_slot.LayoutSlot] with its ID set to id.
  
      Params:
        id = the slot ID
      Returns: a new [gid.adw1.layout_slot.LayoutSlot]
  */
  this(string id) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
      _cretval = adw_layout_slot_new(_id);
      this(_cretval, No.Take);
    }
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

/// Fluent builder implementation template for [gid.adw1.layout_slot.LayoutSlot]
class LayoutSlotGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `id` property.
      Params:
        propval = The slot ID.
          
          See [gid.adw1.multi_layout_view.MultiLayoutView.setChild].
      Returns: Builder instance for fluent chaining
  */
  T id(string propval) nothrow
  {
    return setProperty("id", propval);
  }
}

/// Fluent builder for [gid.adw1.layout_slot.LayoutSlot]
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
