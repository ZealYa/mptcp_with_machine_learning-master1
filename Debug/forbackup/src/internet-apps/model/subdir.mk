################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/internet-apps/model/ping6.cc \
../forbackup/src/internet-apps/model/radvd-interface.cc \
../forbackup/src/internet-apps/model/radvd-prefix.cc \
../forbackup/src/internet-apps/model/radvd.cc \
../forbackup/src/internet-apps/model/v4ping.cc 

CC_DEPS += \
./forbackup/src/internet-apps/model/ping6.d \
./forbackup/src/internet-apps/model/radvd-interface.d \
./forbackup/src/internet-apps/model/radvd-prefix.d \
./forbackup/src/internet-apps/model/radvd.d \
./forbackup/src/internet-apps/model/v4ping.d 

OBJS += \
./forbackup/src/internet-apps/model/ping6.o \
./forbackup/src/internet-apps/model/radvd-interface.o \
./forbackup/src/internet-apps/model/radvd-prefix.o \
./forbackup/src/internet-apps/model/radvd.o \
./forbackup/src/internet-apps/model/v4ping.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/internet-apps/model/%.o: ../forbackup/src/internet-apps/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


