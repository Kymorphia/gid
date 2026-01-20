/// Module for [PathData] class
module cairo.path_data;

import cairo.c.functions;
import cairo.c.types;
import cairo.types;
import gid.gid;

/**
    #cairo_path_data_t is used to represent the path data inside a
    #cairo_path_t.
    
    The data structure is designed to try to balance the demands of
    efficiency and ease-of-use. A path is represented as an array of
    #cairo_path_data_t, which is a union of headers and points.
    
    Each portion of the path is represented by one or more elements in
    the array, (one header followed by 0 or more points). The length
    value of the header is the number of array elements for the current
    portion including the header, (ie. length == 1 + # of points), and
    where the number of points for each element type is as follows:
    
    <programlisting>
        [cairo.types.PathDataType.MoveTo]:     1 point
        [cairo.types.PathDataType.LineTo]:     1 point
        [cairo.types.PathDataType.CurveTo]:    3 points
        [cairo.types.PathDataType.ClosePath]:  0 points
    </programlisting>
    
    The semantics and ordering of the coordinate values are consistent
    with [cairo.context.Context.moveTo], [cairo.context.Context.lineTo], [cairo.context.Context.curveTo], and
    [cairo.context.Context.closePath].
    
    Here is sample code for iterating through a #cairo_path_t:
    
    <informalexample><programlisting>
         int i;
         cairo_path_t *path;
         cairo_path_data_t *data;
    &nbsp;
         path = cairo_copy_path (cr);
    &nbsp;
         for (i=0; i < path->num_data; i += path->data[i].header.length) {
             data = &amp;path->data[i];
             switch (data->header.type) {
             case CAIRO_PATH_MOVE_TO:
                 do_move_to_things (data[1].point.x, data[1].point.y);
                 break;
             case CAIRO_PATH_LINE_TO:
                 do_line_to_things (data[1].point.x, data[1].point.y);
                 break;
             case CAIRO_PATH_CURVE_TO:
                 do_curve_to_things (data[1].point.x, data[1].point.y,
                                     data[2].point.x, data[2].point.y,
                                     data[3].point.x, data[3].point.y);
                 break;
             case CAIRO_PATH_CLOSE_PATH:
                 do_close_path_things ();
                 break;
             }
         }
         cairo_path_destroy (path);
    </programlisting></informalexample>
    
    As of cairo 1.4, cairo does not mind if there are more elements in
    a portion of the path than needed.  Such elements can be used by
    users of the cairo API to hold extra values in the path data
    structure.  For this reason, it is recommended that applications
    always use <literal>data->header.length</literal> to
    iterate over the path data, instead of hardcoding the number of
    elements for each element type.
*/
class PathData
{
  cairo_path_data_t _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for cairo.path_data.PathData");

    _cInstance = *cast(cairo_path_data_t*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }
}
