/// Module for [Arrow] class
module gtk.arrow;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.misc;
import gtk.types;

/**
    GtkArrow should be used to draw simple arrows that need to point in
    one of the four cardinal directions (up, down, left, or right).  The
    style of the arrow can be one of shadow in, shadow out, etched in, or
    etched out.  Note that these directions and style types may be
    amended in versions of GTK+ to come.
    
    GtkArrow will fill any space alloted to it, but since it is inherited
    from #GtkMisc, it can be padded and/or aligned, to fill exactly the
    space the programmer desires.
    
    Arrows are created with a call to [gtk.arrow.Arrow.new_].  The direction or
    style of an arrow can be changed after creation by using [gtk.arrow.Arrow.set].
    
    GtkArrow has been deprecated; you can simply use a #GtkImage with a
    suitable icon name, such as “pan-down-symbolic“. When replacing
    GtkArrow by an image, pay attention to the fact that GtkArrow is
    doing automatic flipping between #GTK_ARROW_LEFT and #GTK_ARROW_RIGHT,
    depending on the text direction. To get the same effect with an image,
    use the icon names “pan-start-symbolic“ and “pan-end-symbolic“, which
    react to the text direction.
*/
class Arrow : gtk.misc.Misc
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
    return cast(void function())gtk_arrow_get_type != &gidSymbolNotFound ? gtk_arrow_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Arrow self()
  {
    return this;
  }

  /**
      Get builder for [gtk.arrow.Arrow]
      Returns: New builder object
  */
  static ArrowGidBuilder builder()
  {
    return new ArrowGidBuilder;
  }

  /** */
  @property gtk.types.ArrowType arrowType()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.ArrowType)("arrow-type");
  }

  /** */
  @property void arrowType(gtk.types.ArrowType propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.ArrowType)("arrow-type", propval);
  }

  /** */
  @property gtk.types.ShadowType shadowType()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.ShadowType)("shadow-type");
  }

  /** */
  @property void shadowType(gtk.types.ShadowType propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.ShadowType)("shadow-type", propval);
  }

  /**
      Creates a new #GtkArrow widget.
  
      Params:
        arrowType = a valid #GtkArrowType.
        shadowType = a valid #GtkShadowType.
      Returns: the new #GtkArrow widget.
  
      Deprecated: Use a #GtkImage with a suitable icon.
  */
  this(gtk.types.ArrowType arrowType, gtk.types.ShadowType shadowType)
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
  void set(gtk.types.ArrowType arrowType, gtk.types.ShadowType shadowType)
  {
    gtk_arrow_set(cast(GtkArrow*)this._cPtr, arrowType, shadowType);
  }
}

/// Fluent builder implementation template for [gtk.arrow.Arrow]
class ArrowGidBuilderImpl(T) : gtk.misc.MiscGidBuilderImpl!T
{


  /** */
  T arrowType(gtk.types.ArrowType propval)
  {
    return setProperty("arrow-type", propval);
  }

  /** */
  T shadowType(gtk.types.ShadowType propval)
  {
    return setProperty("shadow-type", propval);
  }
}

/// Fluent builder for [gtk.arrow.Arrow]
final class ArrowGidBuilder : ArrowGidBuilderImpl!ArrowGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Arrow build()
  {
    return new Arrow(cast(void*)createGObject(Arrow._getGType), No.Take);
  }
}
