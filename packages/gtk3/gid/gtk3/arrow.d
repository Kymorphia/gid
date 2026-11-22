/// Module for [Arrow] class
module gid.gtk3.arrow;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.misc;
import gid.gtk3.types;

/**
    GtkArrow should be used to draw simple arrows that need to point in
    one of the four cardinal directions (up, down, left, or right).  The
    style of the arrow can be one of shadow in, shadow out, etched in, or
    etched out.  Note that these directions and style types may be
    amended in versions of GTK+ to come.
    
    GtkArrow will fill any space alloted to it, but since it is inherited
    from #GtkMisc, it can be padded and/or aligned, to fill exactly the
    space the programmer desires.
    
    Arrows are created with a call to [gid.gtk3.arrow.Arrow.new_].  The direction or
    style of an arrow can be changed after creation by using [gid.gtk3.arrow.Arrow.set].
    
    GtkArrow has been deprecated; you can simply use a #GtkImage with a
    suitable icon name, such as “pan-down-symbolic“. When replacing
    GtkArrow by an image, pay attention to the fact that GtkArrow is
    doing automatic flipping between #GTK_ARROW_LEFT and #GTK_ARROW_RIGHT,
    depending on the text direction. To get the same effect with an image,
    use the icon names “pan-start-symbolic“ and “pan-end-symbolic“, which
    react to the text direction.
*/
class Arrow : gid.gtk3.misc.Misc
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
    return cast(void function())gtk_arrow_get_type != &gidSymbolNotFound ? gtk_arrow_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkArrow";
  }

  /** Returns `this`, for use in `with` statements. */
  override Arrow self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.arrow.Arrow]
      Returns: New builder object
  */
  static ArrowGidBuilder builder() nothrow
  {
    return new ArrowGidBuilder;
  }

  /** */
  @property gid.gtk3.types.ArrowType arrowType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.types.ArrowType)("arrow-type");
  }

  /** */
  @property void arrowType(gid.gtk3.types.ArrowType propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.types.ArrowType)("arrow-type", propval);
  }

  /** */
  @property gid.gtk3.types.ShadowType shadowType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.types.ShadowType)("shadow-type");
  }

  /** */
  @property void shadowType(gid.gtk3.types.ShadowType propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.types.ShadowType)("shadow-type", propval);
  }

  /**
      Creates a new #GtkArrow widget.
  
      Params:
        arrowType = a valid #GtkArrowType.
        shadowType = a valid #GtkShadowType.
      Returns: the new #GtkArrow widget.
  
      Deprecated: Use a #GtkImage with a suitable icon.
  */
  this(gid.gtk3.types.ArrowType arrowType, gid.gtk3.types.ShadowType shadowType) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_arrow_new(arrowType, shadowType);
    this(_cretval, No.Take);
  }

  /**
      Sets the direction and style of the #GtkArrow, arrow.
  
      Params:
        arrowType = a valid #GtkArrowType.
        shadowType = a valid #GtkShadowType.
  
      Deprecated: Use a #GtkImage with a suitable icon.
  */
  void set(gid.gtk3.types.ArrowType arrowType, gid.gtk3.types.ShadowType shadowType) nothrow
  {
    gtk_arrow_set(cast(GtkArrow*)this._cPtr, arrowType, shadowType);
  }
}

/// Fluent builder implementation template for [gid.gtk3.arrow.Arrow]
class ArrowGidBuilderImpl(T) : gid.gtk3.misc.MiscGidBuilderImpl!T
{


  /** */
  T arrowType(gid.gtk3.types.ArrowType propval) nothrow
  {
    return setProperty("arrow-type", propval);
  }

  /** */
  T shadowType(gid.gtk3.types.ShadowType propval) nothrow
  {
    return setProperty("shadow-type", propval);
  }
}

/// Fluent builder for [gid.gtk3.arrow.Arrow]
final class ArrowGidBuilder : ArrowGidBuilderImpl!ArrowGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Arrow build() nothrow
  {
    return new Arrow(cast(void*)createGObject(Arrow._getGType), Yes.Take);
  }
}
