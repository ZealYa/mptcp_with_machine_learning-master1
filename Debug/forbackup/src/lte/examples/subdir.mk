################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/lte/examples/lena-cqi-threshold.cc \
../forbackup/src/lte/examples/lena-deactivate-bearer.cc \
../forbackup/src/lte/examples/lena-distributed-ffr.cc \
../forbackup/src/lte/examples/lena-dual-stripe.cc \
../forbackup/src/lte/examples/lena-fading.cc \
../forbackup/src/lte/examples/lena-frequency-reuse.cc \
../forbackup/src/lte/examples/lena-intercell-interference.cc \
../forbackup/src/lte/examples/lena-pathloss-traces.cc \
../forbackup/src/lte/examples/lena-profiling.cc \
../forbackup/src/lte/examples/lena-rem-sector-antenna.cc \
../forbackup/src/lte/examples/lena-rem.cc \
../forbackup/src/lte/examples/lena-rlc-traces.cc \
../forbackup/src/lte/examples/lena-simple-epc-emu.cc \
../forbackup/src/lte/examples/lena-simple-epc.cc \
../forbackup/src/lte/examples/lena-simple.cc \
../forbackup/src/lte/examples/lena-uplink-power-control.cc \
../forbackup/src/lte/examples/lena-x2-handover-measures.cc \
../forbackup/src/lte/examples/lena-x2-handover.cc 

CC_DEPS += \
./forbackup/src/lte/examples/lena-cqi-threshold.d \
./forbackup/src/lte/examples/lena-deactivate-bearer.d \
./forbackup/src/lte/examples/lena-distributed-ffr.d \
./forbackup/src/lte/examples/lena-dual-stripe.d \
./forbackup/src/lte/examples/lena-fading.d \
./forbackup/src/lte/examples/lena-frequency-reuse.d \
./forbackup/src/lte/examples/lena-intercell-interference.d \
./forbackup/src/lte/examples/lena-pathloss-traces.d \
./forbackup/src/lte/examples/lena-profiling.d \
./forbackup/src/lte/examples/lena-rem-sector-antenna.d \
./forbackup/src/lte/examples/lena-rem.d \
./forbackup/src/lte/examples/lena-rlc-traces.d \
./forbackup/src/lte/examples/lena-simple-epc-emu.d \
./forbackup/src/lte/examples/lena-simple-epc.d \
./forbackup/src/lte/examples/lena-simple.d \
./forbackup/src/lte/examples/lena-uplink-power-control.d \
./forbackup/src/lte/examples/lena-x2-handover-measures.d \
./forbackup/src/lte/examples/lena-x2-handover.d 

OBJS += \
./forbackup/src/lte/examples/lena-cqi-threshold.o \
./forbackup/src/lte/examples/lena-deactivate-bearer.o \
./forbackup/src/lte/examples/lena-distributed-ffr.o \
./forbackup/src/lte/examples/lena-dual-stripe.o \
./forbackup/src/lte/examples/lena-fading.o \
./forbackup/src/lte/examples/lena-frequency-reuse.o \
./forbackup/src/lte/examples/lena-intercell-interference.o \
./forbackup/src/lte/examples/lena-pathloss-traces.o \
./forbackup/src/lte/examples/lena-profiling.o \
./forbackup/src/lte/examples/lena-rem-sector-antenna.o \
./forbackup/src/lte/examples/lena-rem.o \
./forbackup/src/lte/examples/lena-rlc-traces.o \
./forbackup/src/lte/examples/lena-simple-epc-emu.o \
./forbackup/src/lte/examples/lena-simple-epc.o \
./forbackup/src/lte/examples/lena-simple.o \
./forbackup/src/lte/examples/lena-uplink-power-control.o \
./forbackup/src/lte/examples/lena-x2-handover-measures.o \
./forbackup/src/lte/examples/lena-x2-handover.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/lte/examples/%.o: ../forbackup/src/lte/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


