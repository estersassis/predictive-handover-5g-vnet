package projectpredicthandover.simulations.handover5G;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.node.inet.AdhocHost;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import inet.node.ethernet.Eth10G;
import inet.visualizer*.common.IntegratedVisualizer;
import simu5g.world.radio.LteChannelControl;
import simu5g.common.carrierAggregation.CarrierAggregation;
import simu5g.nodes.Upf;
import simu5g.common.binder.Binder;
import simu5g.nodes.NR.gNodeB;
import simu5g.nodes.cars.NRCar;

import projectpredicthandover.veins_inet.VeinsInetManager;
import org.car2x.veins.visualizer.roads.RoadsCanvasVisualizer;

network Highway5G
{
    parameters:
        @display("bgb=736,486");

    submodules:

        routingRecorder: RoutingTableRecorder {
            @display("p=50,77;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=50,125");
            config = xmldoc("demo.xml");
        }

        //# Veins manager module
        veinsManager: VeinsInetManager {
            @display("p=50,227;is=s");
        }
        visualizer: IntegratedVisualizer {
            @display("p=64,320");
        }
        roadsCanvasVisualizer: RoadsCanvasVisualizer {
            @display("p=64,416");
        }
        //# LTE modules
        channelControl: LteChannelControl {
            @display("p=50,25;is=s");
        }
        binder: Binder {
            @display("p=50,175;is=s");
        }
        carrierAggregation: CarrierAggregation {
            @display("p=50.993748,258.7;is=s");
        }
        server: StandardHost {
            @display("p=660,136;is=n;i=device/server");
        }
        router: Router {
            @display("p=561,135;i=device/smallrouter");
        }
        upf: Upf {
            @display("p=462,136");
        }
        gNodeB1: gNodeB {
            //@display("p=1129.71,555.867;is=vl"); // PARA CENARIO A
            @display("p=1843.35,2161.25;is=vl"); // PARA CENARIO B
            //@display("p=2425.22,1342.01;is=vl"); // PARA CENARIO C
        }
        gNodeB2: gNodeB {
            @display("p=1000.35,2161.25;is=vl"); // PARA CENARIO B
            // @display("p=1600,800;is=vl"); // PARA CENARIO A e C
        }
        gNodeB3: gNodeB {
            @display("p=1500,1875;is=vl");  // PARA CENARIO B
            // @display("p=1900,1100;is=vl");  // PARA CENARIO A e C
        }
        gNodeB4: gNodeB {
            @display("p=1070,2560;is=vl");
            // @display("p=2100,500;is=vl");  // PARA CENARIO A e C
        }

        //# submodule vector to store all cars - will be filled dynamically during simulations
        car[0]: NRCar;

    connections allowunconnected:
        server.pppg++ <--> Eth10G <--> router.pppg++;
        router.pppg++ <--> Eth10G <--> upf.filterGate;
        upf.pppg++ <--> Eth10G <--> gNodeB1.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB2.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB3.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB4.ppp;

        gNodeB1.x2++ <--> Eth10G <--> gNodeB2.x2++;
        gNodeB1.x2++ <--> Eth10G <--> gNodeB3.x2++;
        gNodeB3.x2++ <--> Eth10G <--> gNodeB4.x2++;
        gNodeB4.x2++ <--> Eth10G <--> gNodeB2.x2++;

}
