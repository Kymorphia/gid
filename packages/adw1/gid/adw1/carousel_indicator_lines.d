/// Module for [CarouselIndicatorLines] class
module gid.adw1.carousel_indicator_lines;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.carousel;
import gid.adw1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.orientable;
import gid.gtk4.orientable_mixin;
import gid.gtk4.widget;

/**
    A lines indicator for [gid.adw1.carousel.Carousel].
    
    <picture>
      <source srcset="carousel-indicator-lines-dark.png" media="(prefers-color-scheme: dark)">
      <img src="carousel-indicator-lines.png" alt="carousel-indicator-lines">
    </picture>
    
    The [gid.adw1.carousel_indicator_lines.CarouselIndicatorLines] widget shows a set of lines for each page of
    a given [gid.adw1.carousel.Carousel]. The carousel's active page is shown as another line
    that moves between them to match the carousel's position.
    
    See also [gid.adw1.carousel_indicator_dots.CarouselIndicatorDots].
    
    ## CSS nodes
    
    [gid.adw1.carousel_indicator_lines.CarouselIndicatorLines] has a single CSS node with name
    `carouselindicatorlines`.
*/
class CarouselIndicatorLines : gid.gtk4.widget.Widget, gid.gtk4.orientable.Orientable
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
    return cast(void function())adw_carousel_indicator_lines_get_type != &gidSymbolNotFound ? adw_carousel_indicator_lines_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwCarouselIndicatorLines";
  }

  /** Returns `this`, for use in `with` statements. */
  override CarouselIndicatorLines self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.carousel_indicator_lines.CarouselIndicatorLines]
      Returns: New builder object
  */
  static CarouselIndicatorLinesGidBuilder builder() nothrow
  {
    return new CarouselIndicatorLinesGidBuilder;
  }

  /**
      Get `carousel` property.
      Returns: The displayed carousel.
  */
  @property gid.adw1.carousel.Carousel carousel() nothrow
  {
    return getCarousel();
  }

  /**
      Set `carousel` property.
      Params:
        propval = The displayed carousel.
  */
  @property void carousel(gid.adw1.carousel.Carousel propval) nothrow
  {
    setCarousel(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new [gid.adw1.carousel_indicator_lines.CarouselIndicatorLines].
      Returns: the newly created [gid.adw1.carousel_indicator_lines.CarouselIndicatorLines]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = adw_carousel_indicator_lines_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Gets the displayed carousel.
      Returns: the displayed carousel
  */
  gid.adw1.carousel.Carousel getCarousel() nothrow
  {
    AdwCarousel* _cretval;
    _cretval = adw_carousel_indicator_lines_get_carousel(cast(AdwCarouselIndicatorLines*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.carousel.Carousel)(cast(AdwCarousel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the displayed carousel.
  
      Params:
        carousel = a carousel
  */
  void setCarousel(gid.adw1.carousel.Carousel carousel = null) nothrow
  {
    adw_carousel_indicator_lines_set_carousel(cast(AdwCarouselIndicatorLines*)this._cPtr, carousel ? cast(AdwCarousel*)carousel._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.adw1.carousel_indicator_lines.CarouselIndicatorLines]
class CarouselIndicatorLinesGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

  /**
      Set `carousel` property.
      Params:
        propval = The displayed carousel.
      Returns: Builder instance for fluent chaining
  */
  T carousel(gid.adw1.carousel.Carousel propval) nothrow
  {
    return setProperty("carousel", propval);
  }
}

/// Fluent builder for [gid.adw1.carousel_indicator_lines.CarouselIndicatorLines]
final class CarouselIndicatorLinesGidBuilder : CarouselIndicatorLinesGidBuilderImpl!CarouselIndicatorLinesGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CarouselIndicatorLines build() nothrow
  {
    return new CarouselIndicatorLines(cast(void*)createGObject(CarouselIndicatorLines._getGType), Yes.Take);
  }
}
