/// Module for [CarouselIndicatorDots] class
module adw.carousel_indicator_dots;

import adw.c.functions;
import adw.c.types;
import adw.carousel;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.widget;

/**
    A dots indicator for `class@Carousel`.
    
    <picture>
      <source srcset="carousel-indicator-dots-dark.png" media="(prefers-color-scheme: dark)">
      <img src="carousel-indicator-dots.png" alt="carousel-indicator-dots">
    </picture>
    
    The [adw.carousel_indicator_dots.CarouselIndicatorDots] widget shows a set of dots for each page of a
    given `class@Carousel`. The dot representing the carousel's active page is
    larger and more opaque than the others, the transition to the active and
    inactive state is gradual to match the carousel's position.
    
    See also `class@CarouselIndicatorLines`.
    
    ## CSS nodes
    
    [adw.carousel_indicator_dots.CarouselIndicatorDots] has a single CSS node with name
    `carouselindicatordots`.
*/
class CarouselIndicatorDots : gtk.widget.Widget, gtk.orientable.Orientable
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
    return cast(void function())adw_carousel_indicator_dots_get_type != &gidSymbolNotFound ? adw_carousel_indicator_dots_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CarouselIndicatorDots self()
  {
    return this;
  }

  /**
  Get builder for [adw.carousel_indicator_dots.CarouselIndicatorDots]
  Returns: New builder object
  */
  static CarouselIndicatorDotsGidBuilder builder()
  {
    return new CarouselIndicatorDotsGidBuilder;
  }

  /**
      Get `carousel` property.
      Returns: The displayed carousel.
  */
  @property adw.carousel.Carousel carousel()
  {
    return getCarousel();
  }

  /**
      Set `carousel` property.
      Params:
        propval = The displayed carousel.
  */
  @property void carousel(adw.carousel.Carousel propval)
  {
    setCarousel(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new [adw.carousel_indicator_dots.CarouselIndicatorDots].
      Returns: the newly created [adw.carousel_indicator_dots.CarouselIndicatorDots]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_carousel_indicator_dots_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the displayed carousel.
      Returns: the displayed carousel
  */
  adw.carousel.Carousel getCarousel()
  {
    AdwCarousel* _cretval;
    _cretval = adw_carousel_indicator_dots_get_carousel(cast(AdwCarouselIndicatorDots*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.carousel.Carousel)(cast(AdwCarousel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the displayed carousel.
  
      Params:
        carousel = a carousel
  */
  void setCarousel(adw.carousel.Carousel carousel = null)
  {
    adw_carousel_indicator_dots_set_carousel(cast(AdwCarouselIndicatorDots*)this._cPtr, carousel ? cast(AdwCarousel*)carousel._cPtr(No.Dup) : null);
  }
}

class CarouselIndicatorDotsGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T, gtk.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

  /**
      Set `carousel` property.
      Params:
        propval = The displayed carousel.
      Returns: Builder instance for fluent chaining
  */
  T carousel(adw.carousel.Carousel propval)
  {
    return setProperty("carousel", propval);
  }
}

/// Fluent builder for [adw.carousel_indicator_dots.CarouselIndicatorDots]
final class CarouselIndicatorDotsGidBuilder : CarouselIndicatorDotsGidBuilderImpl!CarouselIndicatorDotsGidBuilder
{
  CarouselIndicatorDots build()
  {
    return new CarouselIndicatorDots(cast(void*)createGObject(CarouselIndicatorDots._getGType), No.Take);
  }
}
