/// Module for [CarouselIndicatorDots] class
module gid.adw1.carousel_indicator_dots;

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
    A dots indicator for [gid.adw1.carousel.Carousel].
    
    <picture>
      <source srcset="carousel-indicator-dots-dark.png" media="(prefers-color-scheme: dark)">
      <img src="carousel-indicator-dots.png" alt="carousel-indicator-dots">
    </picture>
    
    The [gid.adw1.carousel_indicator_dots.CarouselIndicatorDots] widget shows a set of dots for each page of a
    given [gid.adw1.carousel.Carousel]. The dot representing the carousel's active page is
    larger and more opaque than the others, the transition to the active and
    inactive state is gradual to match the carousel's position.
    
    See also [gid.adw1.carousel_indicator_lines.CarouselIndicatorLines].
    
    ## CSS nodes
    
    [gid.adw1.carousel_indicator_dots.CarouselIndicatorDots] has a single CSS node with name
    `carouselindicatordots`.
*/
class CarouselIndicatorDots : gid.gtk4.widget.Widget, gid.gtk4.orientable.Orientable
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
    return cast(void function())adw_carousel_indicator_dots_get_type != &gidSymbolNotFound ? adw_carousel_indicator_dots_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwCarouselIndicatorDots";
  }

  /** Returns `this`, for use in `with` statements. */
  override CarouselIndicatorDots self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.carousel_indicator_dots.CarouselIndicatorDots]
      Returns: New builder object
  */
  static CarouselIndicatorDotsGidBuilder builder() nothrow
  {
    return new CarouselIndicatorDotsGidBuilder;
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
      Creates a new [gid.adw1.carousel_indicator_dots.CarouselIndicatorDots].
      Returns: the newly created [gid.adw1.carousel_indicator_dots.CarouselIndicatorDots]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_carousel_indicator_dots_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the displayed carousel.
      Returns: the displayed carousel
  */
  gid.adw1.carousel.Carousel getCarousel() nothrow
  {
    AdwCarousel* _cretval;
    _cretval = adw_carousel_indicator_dots_get_carousel(cast(AdwCarouselIndicatorDots*)this._cPtr);
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
    adw_carousel_indicator_dots_set_carousel(cast(AdwCarouselIndicatorDots*)this._cPtr, carousel ? cast(AdwCarousel*)carousel._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.adw1.carousel_indicator_dots.CarouselIndicatorDots]
class CarouselIndicatorDotsGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.orientable.OrientableGidBuilderImpl!T
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

/// Fluent builder for [gid.adw1.carousel_indicator_dots.CarouselIndicatorDots]
final class CarouselIndicatorDotsGidBuilder : CarouselIndicatorDotsGidBuilderImpl!CarouselIndicatorDotsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CarouselIndicatorDots build() nothrow
  {
    return new CarouselIndicatorDots(cast(void*)createGObject(CarouselIndicatorDots._getGType), Yes.Take);
  }
}
