import GeoJSON from 'ol/format/GeoJSON';
import Map from 'ol/Map';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';
import VectorLayer from 'ol/layer/Vector';
import VectorSource from 'ol/source/Vector';
import View from 'ol/View';
import { transform } from 'ol/proj';
import { Fill, Stroke, Style } from 'ol/style';


const json = '{"type":"MultiPolygon","coordinates":[[[[-46.183978128,-23.544782107],[-46.183623546,-23.543072508],[-46.181679911,-23.53914757],[-46.183557882,-23.537293417],[-46.18723503,-23.532067938],[-46.188876614,-23.530237767],[-46.193525579,-23.533320146],[-46.193880161,-23.535463319],[-46.193197262,-23.537606458],[-46.186092488,-23.542687243],[-46.183978128,-23.544782107]]], [[[-46.191570944,-23.525010881],[-46.191542065,-23.527009548],[-46.190340435,-23.528740843],[-46.188183939,-23.528494922],[-46.186102545,-23.528485085],[-46.186596071,-23.52755058],[-46.187239802,-23.527029222],[-46.187681963,-23.526149724],[-46.188312099,-23.525585096],[-46.188440991,-23.525138643],[-46.188742607,-23.524475035],[-46.189769455,-23.52432826],[-46.191666977,-23.524546633],[-46.191570944,-23.525010881]]]]}';
const features = new GeoJSON().readFeatures(JSON.parse(json), {
    dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'
});

const polygon_style = new Style({
    stroke: new Stroke({
        color: 'blue',
        width: 1,
    }),
    fill: new Fill({
        color: 'rgba(0, 0, 255, 0.1)',
    }),
})

const mylayer = new VectorLayer({
    source: new VectorSource({
        features: features,
    }),
    style: polygon_style,
})


new Map({
    target: 'map',
    layers: [
        new TileLayer({
            source: new OSM()
        }),
        mylayer,
    ],
    view: new View({
        center: transform([-46.1872, -23.5345], 'EPSG:4326', 'EPSG:3857'),
        zoom: 15,
    }),
});