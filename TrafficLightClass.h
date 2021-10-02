#ifndef TrafficLightClass_H
#define TrafficLightClass_H

/* Author: Remy van Elst, https://raymii.org
 * License: GNU AGPLv3
 */

#include <QObject>

/* This class is named TrafficLightClass to make the difference
 * between the C++ side and the QML side clear */

class TrafficLightClass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(LampState lamp READ getLamp NOTIFY lampChanged)
    Q_PROPERTY(bool powerState READ getPowerState WRITE setPowerState NOTIFY powerStateChanged)

public:
    explicit TrafficLightClass(QObject *parent = nullptr);
    enum class LampState {
        Off,
        Red,
        Orange,
        Green,
    };
    Q_ENUM(LampState);

    Q_INVOKABLE void nextLamp();
    Q_INVOKABLE QString dbg() { return "dbg"; }

    Q_INVOKABLE LampState getLamp() { return _lampState; }
    bool getPowerState() { return _lampState != LampState::Off; }

signals:
    void lampChanged();
    void powerStateChanged();

public slots:
    void setPowerState(bool newPowerState);

private:
    void setLamp(LampState newLamp);
    LampState _lampState = LampState::Off;
};

#endif // TrafficLightClass_H
