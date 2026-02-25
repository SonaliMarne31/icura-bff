const GRAPHQL_URL = process.env.BACKEND_URL || 'http://localhost:8000';


async function gql(query, variables = {}, token) {
  const res = await fetch(GRAPHQL_URL, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`,
    },
    body: JSON.stringify({ query, variables }),
  });

  const { data, errors } = await res.json();
  if (errors?.length) throw new Error(errors[0].message);
  return data;
}

async function getAppointments(doctorId, clinicId, token) {
  const res = await fetch(`${BACKEND_URL}/appointments?doctorId=${doctorId}&clinicId=${clinicId}`, {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`,        // forward JWT
      'X-Internal-Secret': process.env.INTERNAL_SECRET, // service-to-service auth
    },
  });

  if (!res.ok) {
    const err = await res.json().catch(() => ({}));
    throw new Error(err.message || `Backend error: ${res.status}`);
  }

  return res.json();
}

// // ── Usage ────────────────────────────────────────────────────
// async function getDoctor(email, token) {
//   return gql(
//     `query getDoctor($doctorId: ID!, $clinicId: ID!, $filters: AppointmentFilterInput) {
//        appointments(doctorId: $doctorId, clinicId: $clinicId, filters: $filters) {
//          id date time status reason
//          patient { name mrn }
//        }
//      }`,
//     { doctorId, clinicId, filters },
//     token
//   );
// }