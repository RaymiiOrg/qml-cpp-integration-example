/* Author: Remy van Elst, https://raymii.org
 * License: GNU AGPLv3
 */

#include "TrafficLightClass.h"

#include <qdebug.h>

TrafficLightClass::TrafficLightClass(QObject *parent) : QObject(parent)
{

}

void TrafficLightClass::setLamp(LampState newLampState)
{
    if(_lampState != newLampState) {
        _lampState = newLampState;
        emit lampChanged();
    }
}

void TrafficLightClass::setPowerState(bool newPowerState)
{
    if (getPowerState() != newPowerState) {
        if (getPowerState()) {
            setLamp(LampState::Off);
        } else {
            setLamp(LampState::Red);
        }
        emit powerStateChanged();
    }
}



void TrafficLightClass::nextLamp()
{
    switch(_lampState) {
    case LampState::Red:
        setLamp(LampState::Green);
        break;
    case LampState::Green:
        setLamp(LampState::Orange);
        break;
    case LampState::Orange:
        setLamp(LampState::Red);
        break;
    }
}

