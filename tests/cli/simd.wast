;; RUN: wast --assert default --snapshot tests/snapshots %

(module
  (type (;0;) (func (result v128)))
  (func (;0;) (type 0) (result v128)
    i32.const 4
    v128.load)
  (func (;1;) (type 0) (result v128)
    i32.const 4
    v128.const i32x4 0x11223344 0x55667788 0x99aabbcc 0xddeeff00
    v128.store
    i32.const 4
    v128.load)
  (func (;2;) (type 0) (result v128)
    v128.const i32x4 0x0000789a 0xff880330 0x0000ffff 0x0000017f
    f64.const 0x1.2p+2 (;=4.5;)
    f64x2.replace_lane 0)
  (func (;3;) (type 0) (result v128)
    v128.const i32x4 0xff00ff01 0xff00ff0f 0xff00ffff 0xff00ff7f
    v128.const i32x4 0x00550055 0x00550055 0x00550055 0x00550155
    i8x16.shuffle 16 1 18 3 20 5 22 7 24 9 26 11 28 13 30 15)

  (func
    i32.const 0 v128.load32_zero drop
    i32.const 0 v128.load64_zero drop)

  ;; Where a result is produced, this uses i8x16.neg and i32.eqz to check that
  ;; a value of the right type is produced
  (func

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i16x8.extmul_low_i8x16_s
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i16x8.extmul_high_i8x16_s
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i16x8.extmul_low_i8x16_u
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i16x8.extmul_high_i8x16_u
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i32x4.extmul_low_i16x8_s
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i32x4.extmul_low_i16x8_u
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i32x4.extmul_high_i16x8_s
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i32x4.extmul_high_i16x8_u
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i64x2.extmul_low_i32x4_s
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i64x2.extmul_low_i32x4_u
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i64x2.extmul_high_i32x4_s
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i64x2.extmul_high_i32x4_u
    i8x16.neg
    drop

    i32.const 0
    v128.const i32x4 1 2 3 4
    v128.load8_lane 15
    i8x16.neg
    drop

    i32.const 0
    v128.const i32x4 1 2 3 4
    v128.load16_lane 7
    i8x16.neg
    drop

    i32.const 0
    v128.const i32x4 1 2 3 4
    v128.load32_lane 3
    i8x16.neg
    drop

    i32.const 0
    v128.const i32x4 1 2 3 4
    v128.load64_lane 1
    i8x16.neg
    drop

    i32.const 0
    v128.const i32x4 1 2 3 4
    v128.store8_lane 15

    i32.const 0
    v128.const i32x4 1 2 3 4
    v128.store16_lane 7

    i32.const 0
    v128.const i32x4 1 2 3 4
    v128.store32_lane 3

    i32.const 0
    v128.const i32x4 1 2 3 4
    v128.store64_lane 1

    v128.const i32x4 1 2 3 4
    v128.any_true
    i32.eqz
    drop

    v128.const i32x4 1 2 3 4
    i8x16.all_true
    i32.eqz
    drop

    v128.const i32x4 1 2 3 4
    i16x8.all_true
    i32.eqz
    drop

    v128.const i32x4 1 2 3 4
    i32x4.all_true
    i32.eqz
    drop

    v128.const i32x4 1 2 3 4
    i64x2.all_true
    i32.eqz
    drop

    v128.const i64x2 1 2
    i64x2.bitmask
    i32.eqz
    drop

    v128.const i32x4 0 0 0 0
    i64x2.extend_low_i32x4_s
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    i64x2.extend_high_i32x4_s
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    i64x2.extend_low_i32x4_u
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    i64x2.extend_high_i32x4_u
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i64x2.eq
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i64x2.ne
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i64x2.lt_s
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i64x2.gt_s
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i64x2.le_s
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i64x2.ge_s
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    v128.const i32x4 0 0 0 0
    i16x8.q15mulr_sat_s
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    f32x4.demote_f64x2_zero
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    f64x2.promote_low_f32x4
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    f64x2.convert_low_i32x4_s
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    f64x2.convert_low_i32x4_u
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    i32x4.trunc_sat_f64x2_s_zero
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    i32x4.trunc_sat_f64x2_u_zero
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    i64x2.abs
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    i8x16.popcnt
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    i16x8.extadd_pairwise_i8x16_s
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    i16x8.extadd_pairwise_i8x16_u
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    i32x4.extadd_pairwise_i16x8_s
    i8x16.neg
    drop

    v128.const i32x4 0 0 0 0
    i32x4.extadd_pairwise_i16x8_u
    i8x16.neg
    drop

    )

  (memory (;0;) 1)
  (export "v128_load_0" (func 0))
  (export "v128_store_0" (func 1))
  (export "func_f64x2_replace_lane_0" (func 2))
  (export "func_i8x16_shuffle_0" (func 3))
  (data (;0;) (i32.const 0) "\ff\ff\ff\ff")
  (data (;1;) (i32.const 4) "\00\00\ceA")
  (data (;2;) (i32.const 8) "\00\00\00\00\00\ff\8f@")
  (data (;3;) (i32.const 16) "\ff\ff\ff\ff\ff\ff\ff\ff"))
