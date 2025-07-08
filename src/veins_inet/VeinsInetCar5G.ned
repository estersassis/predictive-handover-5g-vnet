package projectpredicthandover.veins_inet;
import projectpredicthandover.veins_inet.VeinsInetCar;
import inet.networklayer.configurator.ipv4.HostAutoConfigurator;
import inet.networklayer.ipv4.Ipv4;
import inet.networklayer.ipv4.RoutingTableRecorder;
import simu5g.nodes.NR.NRUe;


module VeinsInetCar5G extends VeinsInetCar
{
    submodules:
        routingRecorder: RoutingTableRecorder {
            @display("p=103.74,193.83;is=s");
        }
        ue: NRUe {
            parameters:
                @display("i=veins/node/car;is=s");
                masterId = default(0);
                nrMasterId = default(1);
                macCellId = default(0);
                nrMacCellId = default(1);
        }
}