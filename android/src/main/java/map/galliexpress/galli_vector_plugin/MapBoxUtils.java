package map.galliexpress.galli_vector_plugin;

import android.content.Context;
import org.maplibre.android.MapLibre;

abstract class MapBoxUtils {
  private static final String TAG = "MapboxMapController";

  static MapLibre getMapbox(Context context) {
    return MapLibre.getInstance(context);
  }
}
