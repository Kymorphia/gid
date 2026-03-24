/// Module for [CarouselIndicatorLines] class
module adw.carousel_indicator_lines;

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
    A lines indicator for `class@Carousel`.
    
    <picture>
      <source srcset="carousel-indicator-dots-lines.png" media="(prefers-color-scheme: dark)">
      <img src="carousel-indicator-lines.png" alt="carousel-indicator-lines">
    </picture>
    
    The [adw.carousel_indicator_lines.CarouselIndicatorLines] widget shows a set of lines for each page of
    a given `class@Carousel`. The carousel's active page is shown as another line
    that moves between them to match the carousel's position.
    
    See also `class@CarouselIndicatorDots`.
    
    ## CSS nodes
    
    [adw.carousel_indicator_lines.CarouselIndicatorLines] has a single CSS node with name
    `carouselindicatorlines`.
*/
class CarouselIndicatorLines : gtk.widget.Widget, gtk.orientable.Orientable
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
    return cast(void function())adw_carousel_indicator_lines_get_type != &gidSymbolNotFound ? adw_carousel_indicator_lines_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CarouselIndicatorLines self()
  {
    return this;
  }

  /**
  Get builder for [adw.carousel_indicator_lines.CarouselIndicatorLines]
  Returns: New builder object
  */
  static CarouselIndicatorLinesGidBuilder builder()
  {
    return new CarouselIndicatorLinesGidBuilder;
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
      Creates a new [adw.carousel_indicator_lines.CarouselIndicatorLines].
      Returns: the newly created [adw.carousel_indicator_lines.CarouselIndicatorLines]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_carousel_indicator_lines_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the displayed carousel.
      Returns: the displayed carousel
  */
  adw.carousel.Carousel getCarousel()
  {
    AdwCarousel* _cretval;
    _cretval = adw_carousel_indicator_lines_get_carousel(cast(AdwCarouselIndicatorLines*)this._cPtr);
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
    adw_carousel_indicator_lines_set_carousel(cast(AdwCarouselIndicatorLines*)this._cPtr, carousel ? cast(AdwCarousel*)carousel._cPtr(No.Dup) : null);
  }
}

class CarouselIndicatorLinesGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T, gtk.orientable.OrientableGidBuilderImpl!T
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

/// Fluent builder for [adw.carousel_indicator_lines.CarouselIndicatorLines]
final class CarouselIndicatorLinesGidBuilder : CarouselIndicatorLinesGidBuilderImpl!CarouselIndicatorLinesGidBuilder
{
  CarouselIndicatorLines build()
  {
    return new CarouselIndicatorLines(cast(void*)createGObject(CarouselIndicatorLines._getGType), No.Take);
  }
}
