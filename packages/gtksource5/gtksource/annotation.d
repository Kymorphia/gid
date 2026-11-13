/// Module for [Annotation] class
module gtksource.annotation;

public import gid.basictypes;
import gid.gid;
import gio.icon;
import gobject.gid_builder;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/**
    Represents an annotation added to [gtksource.view.View], it has a [gtksource.annotation.Annotation.line] property,
    [gtksource.annotation.Annotation.description], icon and a style.
    
    It will be displayed always at the end of a line.
    
    If the style is GTK_SOURCE_ANNOTATION_STYLE_NONE it will use the same color as [gtksource.space_drawer.SpaceDrawer].
*/
class Annotation : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_annotation_get_type != &gidSymbolNotFound ? gtk_source_annotation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceAnnotation";
  }

  /** Returns `this`, for use in `with` statements. */
  override Annotation self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtksource.annotation.Annotation]
      Returns: New builder object
  */
  static AnnotationGidBuilder builder() nothrow
  {
    return new AnnotationGidBuilder;
  }

  /**
      Get `description` property.
      Returns: The text description displayed at [gtksource.annotation.Annotation.line]
  */
  @property string description() nothrow
  {
    return getDescription();
  }

  /**
      Get `icon` property.
      Returns: The icon displayed at [gtksource.annotation.Annotation.line]
        
        It will be displayed before the text description
  */
  @property gio.icon.Icon icon() nothrow
  {
    return getIcon();
  }

  /**
      Get `line` property.
      Returns: The line where to display the annotation
  */
  @property uint line() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("line");
  }

  /**
      Get `style` property.
      Returns: The style of the annotation
  */
  @property gtksource.types.AnnotationStyle style() nothrow
  {
    return getStyle();
  }

  /** */
  this(string description, gio.icon.Icon icon, int line, gtksource.types.AnnotationStyle style) nothrow
  {
    GtkSourceAnnotation* _cretval;
    const(char)* _description = description.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_source_annotation_new(_description, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null, line, style);
    this(_cretval, Yes.Take);
  }

  /** */
  string getDescription() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_source_annotation_get_description(cast(GtkSourceAnnotation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  gio.icon.Icon getIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = gtk_source_annotation_get_icon(cast(GtkSourceAnnotation*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /** */
  int getLine() nothrow
  {
    int _retval;
    _retval = gtk_source_annotation_get_line(cast(GtkSourceAnnotation*)this._cPtr);
    return _retval;
  }

  /** */
  gtksource.types.AnnotationStyle getStyle() nothrow
  {
    GtkSourceAnnotationStyle _cretval;
    _cretval = gtk_source_annotation_get_style(cast(GtkSourceAnnotation*)this._cPtr);
    gtksource.types.AnnotationStyle _retval = cast(gtksource.types.AnnotationStyle)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [gtksource.annotation.Annotation]
class AnnotationGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gtksource.annotation.Annotation]
final class AnnotationGidBuilder : AnnotationGidBuilderImpl!AnnotationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Annotation build() nothrow
  {
    return new Annotation(cast(void*)createGObject(Annotation._getGType), Yes.Take);
  }
}
