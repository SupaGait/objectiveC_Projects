//
//  MeasurementTypes.h
//  JustAUnitConvertor
//
//  Created by epita on 27/05/16.
//  Copyright © 2016 epita. All rights reserved.
//

#ifndef MeasurementTypes_h
#define MeasurementTypes_h

// Possible measurement types
typedef NS_ENUM(NSInteger, MeasurementType) {
    MeasurementTypeArea = 0,
    MeasurementTypeLength,
    MeasurementTypeTemperature
};

typedef NS_ENUM(NSInteger, AreaUnit) {
    AreaUnitSquareKilometer = 0,
    AreaUnitSquareMeter,
    AreaUnitSquarefoot,
    AreaUnitSize
};

typedef NS_ENUM(NSInteger, LengthUnit) {
    LengthUnitMeter = 0,
    LengthUnitKiloMeter,
    LengthUnitMile,
    LengthUnitFoot,
    LengthUnitSize
};

typedef NS_ENUM(NSInteger, TemperatureUnit) {
    TemperatureUnitCelsius = 0,
    TemperatureUnitFahrenheit,
    TemperatureUnitKelvin,
    TemperatureUnitSize
};

#endif /* MeasurementTypes_h */
