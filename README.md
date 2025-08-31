# Predictive Handover Mechanism for Vehicular Networks Using 5G

This project implements a predictive handover mechanism for vehicular 5G networks using supervised LSTM models. It simulates realistic mobility with SUMO and full network stack with OMNeT++, Veins, INET, and Simu5G.

## Objective

To improve service continuity in high-mobility scenarios by predicting handover events based on mobility and signal quality data — reducing latency and increasing throughput in vehicular environments.

## Architecture

- **Mobility**: SUMO + OpenStreetMap
- **Network**: OMNeT++ + INET + Veins + Simu5G
- **Machine Learning**: LSTM model (TensorFlow/Keras)
- **Evaluation**: Network metrics (throughput, CQI, delay) and ML metrics (F1-score, recall)

## Scenarios

Three realistic environments are simulated:
- **Scenario A**: Urban neighborhood (UFMG region)
- **Scenario B**: Highway (BR-381)
- **Scenario C**: Dense city center (Avenida Paulista - SP)
- 
## Requirements

- [OMNeT++ 6.0](https://omnetpp.org/)
- [SUMO 1.8.0](https://sumo.dlr.de/)
- [Simu5G](https://github.com/Unipisa/Simu5G)
- [Veins](https://veins.car2x.org/)
- Python ≥ 3.8 (with TensorFlow, Pandas, Scikit-learn)

## Results Summary

- **Recall** (handover class): 97%
- **F1-score** (handover class): 75%
- **Throughput Gain**: +14 kbps (predicted) vs −82 kbps (reactive)
- **Average CQI gain**: +0.10 (predicted)

Full evaluation available in the `ml/` folder.

## Reproducing the Experiments

1. Run SUMO mobility generation (see `simulations/handover5G/`)
2. Launch OMNeT++ simulation
3. Extract `.vec` logs and convert to `.csv`
4. Train LSTM model with `ml/` scripts
5. Compare metrics (baseline vs predictive)


## Contact

Ester Sara Assis Silva  
estersilva@dcc.ufmg.br

Made at UFMG – Computer Science Department.

---
