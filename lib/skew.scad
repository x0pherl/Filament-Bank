/*skew takes an array of six angles:
 *x along y
 *x along z
 *y along x
 *y along z
 *z along x
 *z along y
 */
module skew(dims) {
matrix = [
	[ 1, tan(dims[0]), tan(dims[1]), 0 ],
	[ tan(dims[2]), 1, tan(dims[3]), 0 ],
	[ tan(dims[4]), tan(dims[5]), 1, 0 ],
	[ 0, 0, 0, 1 ]
];
multmatrix(matrix)
children();
}
