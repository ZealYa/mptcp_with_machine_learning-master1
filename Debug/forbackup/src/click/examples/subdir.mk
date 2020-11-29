################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/click/examples/nsclick-defines.cc \
../forbackup/src/click/examples/nsclick-raw-wlan.cc \
../forbackup/src/click/examples/nsclick-routing.cc \
../forbackup/src/click/examples/nsclick-simple-lan.cc \
../forbackup/src/click/examples/nsclick-udp-client-server-csma.cc \
../forbackup/src/click/examples/nsclick-udp-client-server-wifi.cc 

CC_DEPS += \
./forbackup/src/click/examples/nsclick-defines.d \
./forbackup/src/click/examples/nsclick-raw-wlan.d \
./forbackup/src/click/examples/nsclick-routing.d \
./forbackup/src/click/examples/nsclick-simple-lan.d \
./forbackup/src/click/examples/nsclick-udp-client-server-csma.d \
./forbackup/src/click/examples/nsclick-udp-client-server-wifi.d 

OBJS += \
./forbackup/src/click/examples/nsclick-defines.o \
./forbackup/src/click/examples/nsclick-raw-wlan.o \
./forbackup/src/click/examples/nsclick-routing.o \
./forbackup/src/click/examples/nsclick-simple-lan.o \
./forbackup/src/click/examples/nsclick-udp-client-server-csma.o \
./forbackup/src/click/examples/nsclick-udp-client-server-wifi.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/click/examples/%.o: ../forbackup/src/click/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


