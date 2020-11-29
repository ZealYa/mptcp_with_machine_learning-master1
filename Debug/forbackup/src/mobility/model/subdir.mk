################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/mobility/model/box.cc \
../forbackup/src/mobility/model/constant-acceleration-mobility-model.cc \
../forbackup/src/mobility/model/constant-position-mobility-model.cc \
../forbackup/src/mobility/model/constant-velocity-helper.cc \
../forbackup/src/mobility/model/constant-velocity-mobility-model.cc \
../forbackup/src/mobility/model/gauss-markov-mobility-model.cc \
../forbackup/src/mobility/model/geographic-positions.cc \
../forbackup/src/mobility/model/hierarchical-mobility-model.cc \
../forbackup/src/mobility/model/mobility-model.cc \
../forbackup/src/mobility/model/position-allocator.cc \
../forbackup/src/mobility/model/random-direction-2d-mobility-model.cc \
../forbackup/src/mobility/model/random-walk-2d-mobility-model.cc \
../forbackup/src/mobility/model/random-waypoint-mobility-model.cc \
../forbackup/src/mobility/model/rectangle.cc \
../forbackup/src/mobility/model/steady-state-random-waypoint-mobility-model.cc \
../forbackup/src/mobility/model/waypoint-mobility-model.cc \
../forbackup/src/mobility/model/waypoint.cc 

CC_DEPS += \
./forbackup/src/mobility/model/box.d \
./forbackup/src/mobility/model/constant-acceleration-mobility-model.d \
./forbackup/src/mobility/model/constant-position-mobility-model.d \
./forbackup/src/mobility/model/constant-velocity-helper.d \
./forbackup/src/mobility/model/constant-velocity-mobility-model.d \
./forbackup/src/mobility/model/gauss-markov-mobility-model.d \
./forbackup/src/mobility/model/geographic-positions.d \
./forbackup/src/mobility/model/hierarchical-mobility-model.d \
./forbackup/src/mobility/model/mobility-model.d \
./forbackup/src/mobility/model/position-allocator.d \
./forbackup/src/mobility/model/random-direction-2d-mobility-model.d \
./forbackup/src/mobility/model/random-walk-2d-mobility-model.d \
./forbackup/src/mobility/model/random-waypoint-mobility-model.d \
./forbackup/src/mobility/model/rectangle.d \
./forbackup/src/mobility/model/steady-state-random-waypoint-mobility-model.d \
./forbackup/src/mobility/model/waypoint-mobility-model.d \
./forbackup/src/mobility/model/waypoint.d 

OBJS += \
./forbackup/src/mobility/model/box.o \
./forbackup/src/mobility/model/constant-acceleration-mobility-model.o \
./forbackup/src/mobility/model/constant-position-mobility-model.o \
./forbackup/src/mobility/model/constant-velocity-helper.o \
./forbackup/src/mobility/model/constant-velocity-mobility-model.o \
./forbackup/src/mobility/model/gauss-markov-mobility-model.o \
./forbackup/src/mobility/model/geographic-positions.o \
./forbackup/src/mobility/model/hierarchical-mobility-model.o \
./forbackup/src/mobility/model/mobility-model.o \
./forbackup/src/mobility/model/position-allocator.o \
./forbackup/src/mobility/model/random-direction-2d-mobility-model.o \
./forbackup/src/mobility/model/random-walk-2d-mobility-model.o \
./forbackup/src/mobility/model/random-waypoint-mobility-model.o \
./forbackup/src/mobility/model/rectangle.o \
./forbackup/src/mobility/model/steady-state-random-waypoint-mobility-model.o \
./forbackup/src/mobility/model/waypoint-mobility-model.o \
./forbackup/src/mobility/model/waypoint.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/mobility/model/%.o: ../forbackup/src/mobility/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


